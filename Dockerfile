ARG ARG_PYTHON_VERSION=3.7-alpine3.11
FROM python:${ARG_PYTHON_VERSION} AS base

FROM base AS builder

ARG ARG_WEASYPRINT_VERSION=51

RUN apk add \
            --no-cache \
            --update \
            --upgrade \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
        gcc \
        musl-dev \
        jpeg-dev \
        zlib-dev \
        libffi-dev \
        cairo-dev \
        pango-dev \
        gdk-pixbuf-dev \
    && pip install \
            --user \
            --no-cache-dir \
        weasyprint==$ARG_WEASYPRINT_VERSION

FROM base

RUN apk add \
            --no-cache \
            --update \
            --upgrade \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
        cairo-dev \
        pango-dev \
        gdk-pixbuf-dev

COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH