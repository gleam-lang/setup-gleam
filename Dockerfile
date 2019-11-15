FROM alpine
RUN apk --update add git \
  && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --depth 1 \
  && ~/.asdf/bin/asdf plugin-add gleam https://github.com/vic/asdf-gleam.git

COPY action.sh /action.sh
ENTRYPOINT ["/action.sh"]
