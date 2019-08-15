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
  COPY . ./ca-project
  #copy the whole project so be able to run all
# Declare the port number the container should expose
  EXPOSE 5000
  WORKDIR "./ca-project"
  # Run the application
  CMD ["python", "run.py"]
