FROM python:3.7-buster
# create workdir
WORKDIR /app
# copy the file requirements.txt  to the app directory
COPY . /app/
# install dependencies && make and apply  migrations for DB
RUN  pip3 install -r requirements.txt && python3.7 manage.py makemigrations && python3.7 manage.py migrate
# Expose port
EXPOSE 8000
# start server
CMD ["python3.6","manage.py","runserver","0.0.0.0:8000"]
