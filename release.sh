#!/bin/bash
set -e

uv run python manage.py collectstatic --noinput
uv run python manage.py migrate
uv run python manage.py makesuperuser
