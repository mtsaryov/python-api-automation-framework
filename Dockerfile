# 1. Base image: lightweight Python on Linux
FROM python:3.11-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Environment variables: prevent python from writing pyc files and enable live log streaming
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# 4. Copy dependency definition
COPY requirements.txt .

# 5. Install dependencies without caching to keep image size small
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copy the rest of the application code
COPY . .

# 7. Default command executed when the container starts
CMD ["pytest", "-v"]