#!/bin/sh

settings="ci_cd_demo.settings"
python3 manage.py migrate --settings=$settings
python3 manage.py runserver 0.0.0.0:8000 --settings=$settings