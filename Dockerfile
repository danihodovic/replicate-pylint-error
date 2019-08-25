FROM python:3.7-alpine

RUN apk update \
  # psycopg2 dependencies
  && apk add gcc python3-dev musl-dev git \
  && apk add postgresql-dev \
  # Pillow dependencies
  && apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev \
  # CFFI dependencies
  && apk add libffi-dev py-cffi

COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY . /app/
WORKDIR /app/
CMD ["pylint", "mysite/home/models.py"]
