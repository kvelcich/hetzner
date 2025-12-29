FROM python:3.13-slim-bookworm

# Potentially remove this in production builds
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install UV: https://docs.astral.sh/uv/guides/integration/docker/
COPY --from=ghcr.io/astral-sh/uv:0.9.18 /uv /uvx /bin/
ENV UV_NO_DEV=1
ENV GUNICORN_WORKERS=2

COPY . /app
WORKDIR /app
RUN uv sync --locked

ENV TAILWINDCSS_VERSION=v4.1.18
RUN uv run tailwindcss_install
RUN uv run tailwindcss -i static/css/.tailwind.css -o static/css/generated.tailwind.css --minify

RUN SECRET_KEY=build-time-secret uv run python manage.py collectstatic --noinput

EXPOSE 8000

RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
