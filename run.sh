#!/bin/bash
set -e
gunicorn config.wsgi --log-file -
