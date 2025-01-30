from flask import Flask


# Initialize the app
def create_app():
    app = Flask(__name__)

    # Register blueprints
    from .routes import main
    app.register_blueprint(main)

    return app
