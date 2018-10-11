FROM ubuntu:18.04

COPY helloworld.py /home/user/

RUN /home/user/helloworld.py