#!/bin/bash
set -e
gunicorn config.wsgi --bind 0.0.0.0:8000 --log-file -
