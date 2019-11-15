FROM alpine
RUN apk --update add git bash \
  && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --depth 1 \
  && ~/.asdf/bin/asdf plugin-add gleam https://github.com/vic/asdf-gleam.git \
  && cd ~/.asdf \
  && pwd \
  && ls \
  && ls bin

COPY action.sh /action.sh
ENTRYPOINT ["/action.sh"]
