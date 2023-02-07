FROM python:3.8-alpine
WORKDIR /flask
COPY ./requirements.txt ./flask/requirements.txt
RUN pip install -r flask/requirements.txt
COPY . .
CMD ["python", "src/main.py"]