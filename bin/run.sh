#!/bin/bash
set -e

# Use environment variable or default to 2 workers
WORKERS=${GUNICORN_WORKERS:-2}

exec uv run gunicorn config.wsgi --bind 0.0.0.0:8000 --workers "$WORKERS" --log-file -
