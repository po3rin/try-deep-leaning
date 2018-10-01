FROM revolutionsystems/python:3.6.3-wee-optimized-lto

WORKDIR /usr/src/app

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
