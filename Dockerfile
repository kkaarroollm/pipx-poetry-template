FROM python:3.13.0

WORKDIR /app

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install --user pipx

RUN python3 -m pipx ensurepath
ENV PATH="/root/.local/bin:${PATH}"
RUN pipx install poetry

COPY pyproject.toml poetry.lock /app/
RUN poetry install --no-root

COPY . /app
