FROM ruby:2.5.7

RUN apt-get update -qq && apt-get install -y build-essential nodejs vim

RUN mkdir /aglicake
WORKDIR /aglicake

# ホストのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /aglicake/Gemfile
COPY Gemfile.lock /aglicake/Gemfile.lock

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
COPY . /aglicake

# puma.sockを配置するディレクトリを作成
RUN mkdir tmp/sockets