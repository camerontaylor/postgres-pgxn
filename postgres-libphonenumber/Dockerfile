FROM zitsen/postgres-pgxn

# Prerequres
RUN apt-get update \
    && apt-get install -y protobuf-compiler libre2-dev libgtest-dev libicu-dev libprotobuf-dev libboost-date-time-dev libboost-system-dev libboost-thread-dev libboost-dev openjdk-7-jre cmake \
    && rm -rf /var/lib/apt/lists/*

# Install libphonenumber
RUN cd /tmp && git clone --depth 1 https://github.com/googlei18n/libphonenumber.git \
    && cd libphonenumber/cpp \
    && mkdir build && cd build \
    && cmake .. && make -j 8 && make install \
    && rm -rf /tmp/phonenumber

RUN cd /tmp && git clone https://github.com/blm768/pg-libphonenumber.git \
    && cd pg-libphonenumber \
    && sed 's/static_assert/\/\/static_assert/' -i src/short_phone_number.h \
    && make -j 8 && make install && rm -rf /tmp/pg-libphonenumber
