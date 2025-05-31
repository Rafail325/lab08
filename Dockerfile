FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    && apt-get clean

WORKDIR /app

COPY . .

RUN mkdir -p /logs && \
    mkdir -p _build && \
    cmake -S . -B _build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build _build

VOLUME /logs

WORKDIR /app/_build
CMD ["./hello_world_application/hello_world"]
