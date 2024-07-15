FROM python:alpine

ADD app.py /app.py

RUN pip install flask

CMD ["flask", "run", "-p", "8080"]