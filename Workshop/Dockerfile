FROM ruby:2.7 as base
COPY . /app
WORKDIR /app
ADD Gemfile .
RUN bundle install --gemfile Gemfile

ENV CHROMEDRIVER_VERSION 109.0.5414.74
ENV CHROMEDRIVER_PATH /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver

RUN mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION 
RUN curl -sS -o /opt/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip
RUN ls -l /opt
RUN unzip /opt/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION 
RUN rm /opt/chromedriver_linux64.zip 
RUN chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver

RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	echo "deb http://dl.google.com/linux/chrome/deb stable main " >> /etc/apt/sources.list.d/google-chrome.list &&\
	apt-get -yqq update && \
	apt-get -yqq install google-chrome-stable && \
	rm -rf /var/lib/apt/lists/*

FROM base as test
CMD ["ruby", "test_framework.rb"]

FROM base as run
CMD ["ruby", "main.rb"]
