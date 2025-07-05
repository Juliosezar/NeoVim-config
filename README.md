
✅ Fix: Use django-stubs
To fix this and get proper type inference in Pyright:

1. Install django-stubs
bash
Copy
Edit
pip install django-stubs
Or using pipx (recommended for LSP use):

bash
Copy
Edit
pipx install 'django-stubs[compatible]'
2. Add pyrightconfig.json in your project root
Create pyrightconfig.json and include django-stubs via extraPaths:

json
Copy
Edit
{
  "typeCheckingMode": "basic",
  "extraPaths": [
    "./.venv/lib/python3.10/site-packages"
  ],
  "reportMissingImports": true,
  "reportUnknownMemberType": false,
  "reportUnknownVariableType": false
}
Adjust the Python path to match your virtual environment.
