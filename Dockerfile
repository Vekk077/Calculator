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

# Set the entry point to run the executable
CMD ["./dist/calc"]
