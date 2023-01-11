ARG         base=python:3.10.9-alpine3.17

###


FROM        ${base} AS poetry

ARG         MAKEFLAGS
ARG         POETRY_VERSION=1.3.1

RUN         apk add --no-cache --virtual .build-deps \
                curl \
                build-base \
                libffi-dev && \
            curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/install-poetry.py | python && \
            apk del .build-deps

###

FROM        ${base} as builder

WORKDIR     /usr/app

ENV         POETRY_VIRTUALENVS_CREATE=false
ENV         PATH=/root/.local/bin:$PATH

COPY        --from=poetry /root/.local /root/.local
COPY        pyproject.toml .
COPY        poetry.lock .
# COPY        patches/robotframework.patch .

RUN         apk add --no-cache --virtual .build-deps \
              build-base \
              libffi-dev \
              openssl-dev \
              rust \
              cargo &&\
              # git && \
            poetry install -vv -n --only main --no-root --sync && \
            # (cd /usr/local/lib/python3.10/site-packages/robot && git apply -) < robotframework.patch && \
            apk del .build-deps

###

FROM        ${base}

WORKDIR     /usr/app

ENV         PATH=/root/.local/bin:$PATH
ENV         PYTHONPATH=/usr/app/libs

ENV         RESOURCES=/usr/app
ENV         KEYWORDS=$RESOURCES/keywords
ENV         PROFILES=$RESOURCES/profiles
ENV         TESTSUITES=$RESOURCES/test

ENTRYPOINT  ["robot"]
CMD         ["--runemptysuite", "Testsuites/twitch"]

COPY        --from=poetry /root/.local /root/.local
COPY        --from=builder /usr/local /usr/local
COPY        . .
