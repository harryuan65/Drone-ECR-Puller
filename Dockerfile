FROM docker:20.10.7
RUN apk add --no-cache \
  python3 \
  py3-pip \
  && pip3 install --upgrade pip \
  && pip3 install --no-cache-dir \
  awscli \
  && rm -rf /var/cache/apk/*
COPY ./setup.sh ./

ENTRYPOINT [ "./setup.sh" ]