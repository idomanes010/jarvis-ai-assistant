from flask import Flask
from middleware.error_handler import register_exception_handlers
from utils.app_config import AppConfig
from controllers.home_controller import home_blueprint
from controllers.about_controller import about_blueprint
from controllers.conversation_controller import conversation_blueprint

server = Flask(__name__)

# enable working with server side sessions:
server.secret_key = AppConfig.server_side_session_secret_key

# Register exception handlers:
register_exception_handlers(server)

# Register blueprints:
server.register_blueprint(home_blueprint)
server.register_blueprint(about_blueprint)
server.register_blueprint(conversation_blueprint)


