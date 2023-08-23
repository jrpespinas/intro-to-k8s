# syntax=docker/dockerfile:1
FROM python:3.10-bullseye

# Set curring working directory
WORKDIR /app

# Install dependencies
COPY requirements.in requirements.in
COPY makefile makefile
RUN python -m pip install pip-tools
RUN make pip-compile && make pip-sync

# Copy the rest of the package
COPY . .

# Expose container port
# Access the application e.g. localhost:3000
# EXPOSE 8000

# Run the backend
# Expose application port
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]