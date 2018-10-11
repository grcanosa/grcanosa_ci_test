FROM python:3.6-alpine


COPY index.html /usr/src/
COPY perrillo.jpeg /usr/src/

WORKDIR /usr/src/

CMD python -m http.server