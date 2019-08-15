  # The base image
  FROM ubuntu:latest

  # Install python and pip
  RUN apt-get update -y
  RUN apt-get install -y python-pip python-dev build-essential

  # Install Python modules needed by the Python app
  COPY requirements.txt /home/ubuntu/ca-project/requirements.txt
  RUN pip install --no-cache-dir -r /home/ubuntu/ca-project/requirements.txt

  # Copy files required for the app to run
  COPY run.py /ubuntu/home/ca-project
  
# Declare the port number the container should expose
  EXPOSE 5000

  # Run the application
  CMD ["python", " /home/ubuntu/ca-project/run.py"]
