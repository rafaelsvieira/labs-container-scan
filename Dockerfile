FROM python:3.12.2

RUN apt update -y && apt upgrade -y

RUN groupadd -r demouser && useradd -r -g demouser demouser && \
    mkdir /src && \
    chown -R demouser:demouser /src

COPY src/ /src/

RUN pip3 install -r /src/requirements.txt

USER demouser

WORKDIR /src

ENV FLASK_APP=app.py

EXPOSE 5000

CMD ["flask", "run", "-h", "0.0.0.0"]