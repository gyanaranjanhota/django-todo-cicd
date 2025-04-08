FROM python:3

WORKDIR /data

RUN pip install django==3.2

COPY . .
RUN python3 -m venv venv
RUN venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

RUN venv/bin/activate && python manage.py migrate

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:8000"]


