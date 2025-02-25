# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Set the working directory inside the container
WORKDIR /app

# Copy project files
COPY . .

# Create and activate a virtual environment
RUN python3 -m venv /venv

# Install dependencies inside the virtual environment
RUN /venv/bin/pip install --upgrade pip && /venv/bin/pip install -r requirements.txt

# Set the PATH to use the virtual environment
ENV PATH="/venv/bin:$PATH"

# Expose port 8000
EXPOSE 8000

# Run FastAPI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
