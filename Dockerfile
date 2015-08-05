# Jenkins container based off of Jenkins Official Docker Image
# Modified to bundle installations for Node, Bower, Gulp, Sass, and BZip
FROM jenkins:latest
MAINTAINER ben.alton@live.com
USER root
# Setup Node Repository
RUN curl -sL https://deb.nodesource.com/setup | bash -
# Setup Google Linux Key and Google Repo.
RUN wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#Perform Apt-Get Installs and Updates.
RUN apt-get update && apt-get install -y \ 
                              nodejs \
                              bzip2 \ 
                              ruby-sass \
			      google-chrome-stable \
			      xvfb \
			      build-essential
    && apt-get clean
RUN npm install -g npm
RUN npm install -g gulp bower && gem install compass
USER jenkins

