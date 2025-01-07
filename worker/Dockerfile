FROM ruby:3.3.6

RUN apt update
RUN apt upgrade -y
RUN apt install lsb-base lsb-release

#PostgresSql
#Create the file repository configuration:
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

#Import the repository signing key:
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt update \
    && apt install -y libpq-dev \
    vim \
    htop \
    postgresql-14

RUN gem install pg

ADD . /app/web
WORKDIR /app/web

RUN bundle install --jobs 5 --retry 5

COPY ./app/worker/entrypoint.sh /app/web/worker/entrypoint.sh

RUN chmod +x /app/web/worker/entrypoint.sh

CMD bash /app/web/worker/entrypoint.sh