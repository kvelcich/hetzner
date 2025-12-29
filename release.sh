#!/bin/bash
set -e

# Note: collectstatic is run during Docker build, not here
# This ensures the manifest exists before the app starts
uv run python manage.py migrate
uv run python manage.py makesuperuser
