FROM clkao/postgres-plv8:9.6-2.0

MAINTAINER Huo Linhe <linhehuo@gmail.com>

RUN buildDependencies="build-essential ca-certificates curl git-core postgresql-server-dev-$PG_MAJOR python-pip" \
    && apt-get update \
    && apt-get install -y --no-install-recommends ${buildDependencies} \
    && curl -LO https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm \
    && chmod +x cpanm \
    && ./cpanm -n App::cpanminus App::Sqitch DBD::Pg \
    && pip install pgxnclient \
    && pgxn install pgTAP \
    && apt-get clean \
    && apt-get remove -y ${buildDependencies} \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
