# Use a newer base image
FROM python:3.7-slim

# Set the working directory
WORKDIR /app

# Copy the application code
COPY . .

# Install system dependencies for building Python packages
RUN apt-get update && apt-get install -y gcc musl-dev libffi-dev

# Upgrade pip
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install -r requirements.txt

# Set environment variables
ENV PORT=5000

# Expose the port
EXPOSE $PORT

# Set the entrypoint and command
ENTRYPOINT ["python"]
CMD ["app.py"]
