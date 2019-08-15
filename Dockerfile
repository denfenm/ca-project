  # The base image
  FROM ubuntu:latest

  # Install python and pip
  RUN apt-get update && apt-get install -y \
     python-pip \
     python-dev \
     build-essential

  # Install Python modules needed by the Python app
  COPY requirements.txt ./ca-project/
  RUN pip install -r ./ca-project/requirements.txt

  # Copy files required for the app to run
  COPY run.py ./ca-project
  
# Declare the port number the container should expose
  EXPOSE 5000

  # Run the application
  CMD ["python", " ./ca-project/run.py"]
