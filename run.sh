#!/bin/bash
echo "Migrating database...."
python3 ./manage.py migrate
echo "Collecting static files"
python3 ./manage.py collectstatic --noinput
echo "Starting Django..."
# python3 ./manage.py runserver
exec gunicorn mysite.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 3
