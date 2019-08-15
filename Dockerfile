  # The base image
  FROM ubuntu:latest

  # Install python and pip
  RUN apt-get update -y
  RUN apt-get install -y python-pip python-dev build-essential

  # Install Python modules needed by the Python app
  COPY requirements.txt /usr/src/app/requirements.txt
  RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

  # Copy files required for the app to run
  COPY run.py /sdu cont n devops/git sofus/circleci/ca-project
  
# Declare the port number the container should expose
  EXPOSE 5000

  # Run the application
  CMD ["python", " /sdu cont n devops/git sofus/circleci/ca-project/run.py"]
