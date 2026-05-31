from flask import session
from models.conversation_model import ConversationModel
from models.message_model import MessageModel
from utils.dal import Dal

class ConversationService:

    def __init__(self) -> None:
        self.dal = Dal()
        self.session = self.dal.create_session()

    # Create a new conversation and return its id:
    def create_conversation(self) -> int:
        conversation = ConversationModel()
        self.session.add(conversation)
        self.session.commit()
        return conversation.id # type: ignore
    
    # Return a conversation by its id if it exists:
    def get_conversation_by_id(self, conversation_id: int) -> ConversationModel | None:
        return self.session.query(ConversationModel).filter(ConversationModel.id == conversation_id).first()
    
    # Return the full chat history for a specific conversation ordered chronologically.
    def get_chat_history(self, conversation_id: int, limit: int = 20) -> list:
        history = self.session.query(MessageModel)\
            .filter(MessageModel.conversation_id == conversation_id)\
            .order_by(MessageModel.created_at.desc())\
            .limit(limit)\
            .all()
        return history
    
    # save a new message in DataBase:
    def add_message(self, conversation_id: int, role: str, content: str) -> None:
        # Normalize incoming roles so the DB stores the value expected by the schema
        # Database currently uses 'assistant' as the assistant role; accept 'jarvis' as synonym
        normalized_role = "assistant" if role in ("assistant", "jarvis") else role
        message = MessageModel(conversation_id = conversation_id, role = normalized_role, content = content)
        self.session.add(message)
        self.session.commit() # save message in DB
   
    # Closing:
    def close(self):
        self.session.close()

    # Enable with:
    def __enter__(self):
       return self
    
    # Exit with:
    def __exit__(self, exc_type, exc, tb):
        self.session.close()
