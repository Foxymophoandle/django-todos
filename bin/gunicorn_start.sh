#!/usr/bin/env bash

NAME="django_todos"
VIRTUALENVDIR=/home/davide/.virtualenvs/todos
DJANGODIR=/home/davide/PycharmProjects/django_todos
SOCKFILE=/home/davide/PycharmProjects/django_todos/run/gunicorn.sock
NUM_WORKERS=5                                     # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=django_todos.settings             # which settings file should Django use
DJANGO_WSGI_MODULE=django_todos.wsgi                     # WSGI module name

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $VIRTUALENVDIR
source bin/activate

cd $DJANGODIR
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
cd $VIRTUALENVDIR
exec bin/gunicorn ${DJANGO_WSGI_MODULE}:application --name $NAME --workers $NUM_WORKERS --bind=unix:$SOCKFILE --log-level=debug --log-file=-