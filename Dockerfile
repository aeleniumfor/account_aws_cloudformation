FROM python:3.9.16-slim-bullseye

RUN apt update && apt -y install git && apt -y install curl unzip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && sh ./aws/install

ARG USERNAME="formation"
RUN adduser ${USERNAME}
USER ${USERNAME}

WORKDIR /home/${USERNAME}/workdir
COPY ./requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt
