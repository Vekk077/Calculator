# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy necessary files into the container
COPY Calculator/calc.py .
COPY Calculator/requirements.txt .

# Install dependencies with error handling
RUN pip install --no-cache-dir -r requirements.txt || echo "Some dependencies failed to install, continuing..."

# Install pyinstaller separately to ensure it works
RUN pip install pyinstaller

# Expose port 8080 to allow access
EXPOSE 8080

# Run the application
CMD ["python", "-m", "http.server", "8080"]
