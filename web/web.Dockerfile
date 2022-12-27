FROM python:3.10-slim AS web

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip


WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 8000
# RUN python manage.py migrate
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


# CMD exec gunicorn WFMBCM.wsgi:application --bind 0.0.0.0:8000 --workers 10