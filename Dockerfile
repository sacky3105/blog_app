# Dockerfile
FROM ruby:3.3.4

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Bundlerのアップグレード
RUN gem install bundler:2.5.11

# 作業ディレクトリの設定
WORKDIR /myapp

# GemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Gemのインストール
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . /myapp


