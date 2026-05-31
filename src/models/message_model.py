from datetime import datetime, UTC
from typing import Optional
from sqlalchemy import Column, DateTime, Integer, TEXT, Enum
from utils.dal import BaseModel
from pydantic import BaseModel as BaseSchema, Field

# Message schema for receiving request and validation:
class MessageSchema(BaseSchema):
    id: Optional[int] = None
    conversation_id: int = Field(gt=0)
    role: str = Field(pattern="^(user|assistant|jarvis)$")
    content: str = Field(min_length=1)

    class Config:
        arbitrary_types_allowed = True
        populate_by_name = True


# Message model mapping to the MySQL database table:
class MessageModel(BaseModel):

    # Database table name:
    __tablename__ = "messages"

    # Table columns tailored exactly to your DB schema:
    id = Column(Integer, primary_key=True, autoincrement=True)
    conversation_id = Column(Integer, nullable=False)
    role = Column(Enum("user", "jarvis", "assistant", name="message_role"), nullable=False)
    content = Column(TEXT, nullable=False)
    created_at = Column(DateTime, default=lambda: datetime.now(UTC))

    # Convert message object into a dictionary safely
    def to_dict(self):
        role_value = str(self.role)
        if role_value == "assistant":
            role_value = "jarvis"

        return {
            "id": self.id,
            "conversation_id": self.conversation_id, 
            "role": role_value,            
            "content": self.content
        }