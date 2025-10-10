# Simple Flask app with intentional errors for testing auto-fix

# Error 1: Missing import (will cause ImportError)
# from flask import Flask

# Error 2: Syntax error - missing closing parenthesis  
def create_app(:
    # Error 3: Using undefined variable
    app = Flask(__name__
    
    @app.route('/')
    def hello():
        # Error 4: String not closed properly
        return "Hello, World!
    
    # Error 5: Missing return statement
    # return app

if __name__ == '__main__':
    app = create_app()
    # Error 6: Undefined variable (cnt)
    print(f"Starting server on port {port}")
    app.run(host='0.0.0.0', port=5000)
