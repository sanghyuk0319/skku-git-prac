FROM python:3.9.12

COPY . /user/src/app
WORKDIR /user/src/app

RUN pip install --no-cache-dir -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate

RUN chmod 777 -R /user/src/app

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8000