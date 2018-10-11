FROM python:3.6-alpine

ARG COMMIT_ID

COPY index.html /usr/src/
COPY perrillo.jpeg /usr/src/
ENV COMID=${COMMIT_ID}

RUN sed -i -e "s/%%COMMIT_ID%%/$COMID/g" /usr/src/index.html

WORKDIR /usr/src/
EXPOSE 8567
CMD python -m http.server 8567