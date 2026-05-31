from typing import Optional
from sqlalchemy import Column, Integer, TIMESTAMP, String, text
from utils.dal import BaseModel
from pydantic import BaseModel as BaseSchema, Field
from datetime import datetime

# Conversation schema for validation and serialization:
class ConversationSchema(BaseSchema):

    id: Optional[int] = None
    # title: Optional[str] = Field(default=None, max_length=255)
    created_at: Optional[datetime] = Field(default=None)

    # inner class for configuration
    class Config:
        arbitrary_types_allowed = True
        populate_by_name = True

# Conversation model:
class ConversationModel(BaseModel):

    # Database table name:
    __tablename__ = "conversations"

    # Table columns matching DB:
    id = Column(Integer, primary_key=True, autoincrement=True)
    # title = Column(String(255), nullable=True)
    created_at = Column(TIMESTAMP, server_default=text("CURRENT_TIMESTAMP"), nullable=False)

    # Convert conversation object into a dictionary:
    def to_dict(self):
        return {
            "id": self.id,
            # "title": self.title,
            "created_at": self.created_at.isoformat() if self.created_at else None # type: ignore
        }
