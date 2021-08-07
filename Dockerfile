FROM python:alpine

WORKDIR /app
COPY requirements.txt ./

RUN apk add --no-cache --virtual build-deps \
      gcc \
      musl-dev && \
    apk add --no-cache \
      openssl \
      py3-lxml && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del build-deps

COPY . .
CMD ["python3", "-u", "bot/main.py"]