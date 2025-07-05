FROM python:3.10-slim
WORKDIR /app
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gcc \
        libpq-dev \
        libffi-dev \
        libssl-dev \
        libxml2-dev \
        libxslt-dev \
        git && \
        rm -rf /var/lib/apt/lists/*
COPY . /app
RUN pip install --upgrade pip && \
    pip install -r requirements.txt
ENV PYTHONPATH=/app
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

