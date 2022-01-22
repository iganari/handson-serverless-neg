# https://github.com/JasonHaley/hello-python/tree/master/app

FROM python:3.9.2-buster
# https://hub.docker.com/_/python

RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD ["python3", "/app/main.py"]
