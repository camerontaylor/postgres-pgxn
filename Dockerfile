FROM postgres:9.5

# Prerequres
RUN apt-get update \
    && apt-get install -y postgresql-plperl-9.5 build-essential postgresql-server-dev-9.5 libphonenumber-dev curl python-pip cpanminus\
    && rm -rf /var/lib/apt/lists/*
# Install Perl distributions
RUN curl -LO https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm \
    && chmod +x cpanm \
    && ./cpanm -n Digest::HMAC_SHA1 \
    && rm -fr ./cpanm /root/.cpanm
RUN pip install pgxnclient \
    && pgxn install otp

RUN cd /tmp \
    && git clone https://github.com/blm768/pg-libphonenumber \
    && cd pg-libphonenumber \
    && make \
    && make install \
    && rm -rf /tmp/pg-libphonenumber \
