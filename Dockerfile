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
    rm -rf _build && \
    mkdir _build && \
    cd _build && \
    cmake .. -DCMAKE_INCLUDE_PATH=/app/include -DCMAKE_BUILD_TYPE=Release && \
    cmake --build .

VOLUME /logs

WORKDIR /app/_build
CMD ["./hello_world_application/hello_world"]
