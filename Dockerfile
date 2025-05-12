# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the necessary files into the container
COPY calc.py .
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install pyinstaller

# Build the executable
RUN pyinstaller --onefile -w calc.py

# Expose port 8080
EXPOSE 8080

# Set the entry point and ensure the app binds to 0.0.0.0:8080
CMD ["python", "-m", "http.server", "8080"]
