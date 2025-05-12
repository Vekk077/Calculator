# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy necessary files into the container
COPY Calculator/calc.py .
COPY Calculator/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 to allow access
EXPOSE 8080

# Run the application
CMD ["python", "-m", "http.server", "8080"]
