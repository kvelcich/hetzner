# mimiclay

A production-ready Django starter template with HTMX, Tailwind CSS, and Docker. Built for rapid development and deployment to Appliku.

## Features

- **Django 6.0** - Latest Django with modern Python 3.13
- **HTMX** - Dynamic UIs without heavy JavaScript frameworks
- **Tailwind CSS** - Utility-first CSS framework with JIT compilation
- **Docker & Docker Compose** - Containerized development and production environments
- **PostgreSQL** - Production-ready database with Docker Compose setup
- **Appliku Deployment Ready** - Pre-configured for seamless deployment
- **uv Package Manager** - Fast, reliable Python package management
- **Gunicorn & WhiteNoise** - Production-ready WSGI server with static file serving

## Prerequisites

- Python 3.13+
- Docker and Docker Compose
- Node.js and npm (for Tailwind CSS)
- [uv](https://docs.astral.sh/uv/) package manager

## Quick Start

### Development Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd mimiclay
   ```

2. **Start the development environment**
   ```bash
   docker-compose up
   ```

   The application will be available at `http://127.0.0.1:8000`

### Local Development (without Docker)

If you prefer to run Django locally:

```bash
# Set up the database URL
export DATABASE_URL=postgresql://postgres:postgres@localhost:5432/django_db

# Run migrations
uv run python manage.py migrate

# Create a superuser
uv run python manage.py createsuperuser

# Run the development server
uv run python manage.py runserver
```

## Project Structure

```
mimiclay/
- config/               # Django settings and configuration
- main/                 # Main Django app
  - static/             # Static files (CSS, JS, images)
  - templates/          # HTML templates
  - views.py            # View functions
- Dockerfile            # Production Docker image
- docker-compose.yaml   # Development environment setup
- manage.py             # Django management script
- pyproject.toml        # Python dependencies (uv)
- release.sh            # Release script (migrations, collectstatic)
- run.sh                # Production startup script
```

### Environment Variables

The following environment variables are required in production:

- `DATABASE_URL` - PostgreSQL connection string
- `SECRET_KEY` - Django secret key (set in production)
- `DEBUG` - Set to `False` in production
- `ALLOWED_HOSTS` - Comma-separated list of allowed hosts
- `GUNICORN_WORKERS` - Number of Gunicorn workers (optional, defaults to auto)

## Deploying to Appliku

This template is pre-configured for Appliku deployment:

1. **Push your code to a Git repository** (GitHub, GitLab, etc.)

2. **Create a new application on Appliku**
   - Connect your repository
   - Appliku will automatically detect the Dockerfile

3. **Configure environment variables**
   - Set `DATABASE_URL` (Appliku provides PostgreSQL)
   - Set `SECRET_KEY` (generate a secure key)
   - Set `ALLOWED_HOSTS` to your domain
   - Set `DEBUG=False`

4. **Configure nginx to serve static files** (for maximum performance)
   - In Appliku, go to your app's Settings → Advanced
   - Find the "Static Files" or "Nginx Configuration" section
   - Set the static files path to: `/app/staticfiles`
   - Set the static URL to: `/static/`
   - This allows nginx to serve static files directly, bypassing Django entirely

5. **Deploy**
   - Appliku will build the Docker image and deploy
   - The `release.sh` script automatically runs migrations and collects static files

For detailed Appliku documentation, visit [appliku.com/docs](https://appliku.com/docs)
