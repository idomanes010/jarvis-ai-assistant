from pydantic import ValidationError
import logging
import json
from flask import Blueprint, jsonify, render_template, request, Response, stream_with_context
from models.message_model import MessageSchema
from services.gpt_service import gpt_service
from services.conversation_service import ConversationService

logger = logging.getLogger(__name__)
conversation_blueprint = Blueprint("conversation_controller", __name__)

# Render home page
@conversation_blueprint.get("/home")
def home_page():

    return render_template("pages/home.html")


# =========================
# CREATE CONVERSATION
# =========================

# Create a new conversation
@conversation_blueprint.post("/api/conversations")
def create_new_conversation():

    try:

        with ConversationService() as service:

            db_id = service.create_conversation()

        return jsonify({
            "status": "success",
            "conversation_id": db_id
        }), 201

    except Exception:

        logger.exception("Failed to create conversation")

        return jsonify({
            "error": "Failed to start conversation session."
        }), 500


# =========================
# CHAT ENDPOINT
# =========================

# Send message to conversation
@conversation_blueprint.post("/api/conversations/<int:conversation_id>")
def add_message_to_conversation(conversation_id: int):

    try:

        # Extract message content
        content = (
            request.json.get("content")
            if request.json
            else None
        )

        # Validate content existence
        if not content:

            return jsonify({
                "error": "content is required"
            }), 400

        # Validate incoming payload
        schema = MessageSchema(
            conversation_id=conversation_id,
            role="user",
            content=content
        )

        with ConversationService() as service:

            # Ensure conversation exists
            if not service.get_conversation_by_id(conversation_id):

                return jsonify({
                    "error": "Conversation not found"
                }), 404

            # Save user message
            service.add_message(
                schema.conversation_id,
                schema.role,
                schema.content
            )

            # Build OpenAI payload
            messages = [
                {
                    "role": "system",
                    "content": (
                        "You are Jarvis, an expert AI assistant. "
                        "Provide direct and specific answers. "
                        "Avoid generic greetings. "
                        "Be concise, helpful and friendly."
                    )
                }
            ]

            # Fetch latest messages
            db_history = service.get_chat_history(
                conversation_id,
                limit=20
            )

            # Convert DB messages into OpenAI format
            for msg in reversed(db_history):

                role_str = (
                    str(msg.role).lower()
                    if msg.role is not None
                    else ""
                )

                messages.append({
                    "role": (
                        "assistant"
                        if role_str in ("assistant", "jarvis")
                        else "user"
                    ),

                    "content": msg.content
                })

            # Get AI response
            try:

                ai_response = gpt_service.get_completion(messages)

            except Exception:

                logger.exception("GPT completion error")

                return jsonify({
                    "error": "AI service failed"
                }), 502

            # Save assistant response
            service.add_message(
                conversation_id,
                "jarvis",
                ai_response
            )

            # Return response
            return jsonify({
                "status": "success",
                "content": ai_response
            })

    # Validation errors
    except ValidationError as err:

        prop = err.errors()[0]["loc"][0]
        msg = err.errors()[0]["msg"]

        return jsonify({
            "error": f"Invalid {prop}: {msg}"
        }), 400

    # General errors
    except Exception:

        logger.exception("Critical server error")

        return jsonify({
            "error": "Internal server error"
        }), 500

