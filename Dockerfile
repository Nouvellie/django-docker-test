FROM python:3.9.5

ENV PYTHONNUNBUFFERED 1
RUN mkdir /code

RUN apt-get install default-libmysqlclient-dev -y

WORKDIR /code
COPY . /code

RUN pip install -r requirements.txt

# CMD ["gunicorn", "-c", "config/gunicorn/conf.py", "--bind", ":8000", "--chdir", "lol', 'wsgi:application"]
CMD gunicorn --bind:8000 --chdir lol.wsgi:application