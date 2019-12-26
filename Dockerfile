FROM ruby:2.6.5-alpine

RUN apk add bash jq
RUN gem install oauth twurl
RUN wget https://github.com/cympfh/tw/archive/master.zip && unzip master.zip && rm master.zip
ENV PATH $PATH:/tw-master/bin

WORKDIR /work
COPY . .
