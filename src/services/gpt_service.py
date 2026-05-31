from openai import OpenAI
from utils.app_config import AppConfig

class GptService:

    def __init__(self) -> None:
        self.client = OpenAI(api_key=AppConfig.chat_gpt_api_key)

    # NON-stream (optional fallback)
    def get_completion(self, messages: list) -> str:
        response = self.client.chat.completions.create(
            model="gpt-4o-mini",
            messages=messages
        )
        # Return completion:
        completion = response.choices[0].message.content
        return completion # type: ignore
gpt_service = GptService()

