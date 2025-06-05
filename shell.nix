# shell.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # These are the system-level dependencies Nix will provide.
  buildInputs = [
    # Python and its tools
    pkgs.python313 # Or pkgs.python310, pkgs.python312, etc. Choose your preferred Python version.
    # Optional: if you prefer pipenv over pip+venv

    # Web browsers and their respective drivers for Selenium
    pkgs.chromium         # Google Chrome / Chromium browser
    pkgs.chromedriver     # WebDriver for Chromium/Chrome

    # Uncomment the lines below if you prefer Firefox over Chromium
    pkgs.firefox
    pkgs.geckodriver      # WebDriver for Firefox

    # Other useful development tools
    pkgs.git              # Version control
    pkgs.sqlitebrowser     # GUI tool for SQLite databases (if you're using SQLite)
    # pkgs.postgresql       # If you need PostgreSQL client tools (e.g., psql)
    # pkgs.nodePackages.pnpm # If your project also involves frontend with pnpm
    # pkgs.nodePackages.npm  # If your project also involves frontend with npm
  ];

  # Define environment variables or run commands when entering the shell
  shellHook = ''
    echo "Welcome to the Django/Selenium Nix development environment!"
    echo "---------------------------------------------------------"
    echo "Available Python: $(which python)"
    echo "Available Pip:    $(which pip)"
    echo "Available Chrome: $(which chromium)"
    echo "Available Chromedriver: $(which chromedriver)"
    echo "---------------------------------------------------------"
    echo "Recommended steps for Python project setup:"
    echo "1. Create a virtual environment: 'python -m venv .venv'"
    echo "2. Activate it: 'source .venv/bin/activate'"
    echo "3. Install dependencies: 'pip install -r requirements.txt'"
    echo "4. Or if using pipenv: 'pipenv install'"
  '';



  # Optional: If you want to add specific Python packages directly via Nix
  # This approach is less common for development shells where you manage
  # your Python dependencies with pip/venv, but can be useful for core tools.
  # For Django/Selenium, it's usually better to use pip.
  #
  pythonWithPackages = pkgs.python313.withPackages (p: [
    p.pip
    #p.openai-whisper

  ]);
}
