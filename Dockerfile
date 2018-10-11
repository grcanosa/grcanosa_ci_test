FROM python:3.6-alpine


COPY helloworld.py /usr/src/


CMD ["/usr/src/helloworld.py"]