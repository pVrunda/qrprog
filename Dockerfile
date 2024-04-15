FROM python:3.12.2-bullseye
RUN apt-get update &&\
    /usr/local/bin/python3 -m pip install --upgrade pip &&\
    /usr/local/bin/python3 -m pip install --upgrade setuptools &&\
    adduser myuser
ENV PATH="/home/myuser/.local/bin:${PATH}"
ENV QR_CODE_IMAGE_DIRECTORY='images'
ENV QR_CODE_DEFAULT_URL='https://hub.docker.com/r/vrunda24/qrprog'
ENV QR_CODE_DEFAULT_FILE_NAME='vrunda24_qr_project_docker_repo.png'
WORKDIR /home/myuser
COPY --chown=myuser:myuser . .
RUN pip3 install -r requirements.txt
ENTRYPOINT ["runuser", "-u", "myuser", "--", "python3"]
CMD ["main.py"]