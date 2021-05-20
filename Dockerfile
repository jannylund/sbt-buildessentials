FROM adoptopenjdk/openjdk8:debianslim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        build-essential \
        git \
        gnupg2 \
        libsass1 \
        openssh-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

ENV SBT_VERSION=1.3.13
ADD http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb sbt-$SBT_VERSION.deb
RUN dpkg -i sbt-$SBT_VERSION.deb && rm sbt-$SBT_VERSION.deb && sbt sbtVersion