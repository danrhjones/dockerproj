FROM python:3.7.3-stretch

WORKDIR /app

COPY . /app/

# hadolint ignore=DL3013
RUN pip install --upgrade pip 
RUN pip install --no-cache-dir -r requirements.txt