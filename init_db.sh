#!/bin/sh
echo "------ Create database tables ------"
python manage.py migrate --noinput

echo "------ create default admin user ------"
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@standup_pivots.local', 'REPLACE_WITH_SUPER_SECRET_PASSWORD')" | python manage.py shell

echo "------ starting gunicorn &nbsp;------"
gunicorn standup_pivots.wsgi --workers 2