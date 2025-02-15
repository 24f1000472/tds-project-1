FROM nikolaik/python-nodejs:python3.13-nodejs23-slim

# Install uv.
# COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install prettier.
RUN npm install -g prettier

# Copy the application into the container.
COPY . /app

# Install the application dependencies.
WORKDIR /app
RUN uv sync --frozen --no-cache

# Run the application.
CMD ["/app/.venv/bin/fastapi", "run", "main.py", "--port", "8000", "--host", "0.0.0.0"]