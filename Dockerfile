FROM ruby:2.4.3-stretch

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
## Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get update -qq \
	&& apt-get install -y -qq \
		curl build-essential nodejs yarn \
    imagemagick openssh-client \
    libmagickwand-dev git libsqlite3-dev \
	&& rm -rf /var/lib/apt/lists/*


## Install packages
RUN gem install bundler --no-ri --no-rdoc
