from flask import Flask


def create_app(config_object=None):
    """Creates app and registers extensions and routes.
    Args:
        config_object: flask configuration object.
    Returns:
        Configured flask application.

    """
    app = Flask(__name__)

    app.config.from_object("config.default")
    if config_object is None:
        app.config.from_envvar("APP_SETTINGS")
    else:
        app.config.from_object(config_object)

    from app.api import api_bp
    app.register_blueprint(api_bp)

    return app