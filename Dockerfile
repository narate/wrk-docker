FROM alpine:edge as build

RUN apk --update --no-cache add lua-dev luarocks build-base perl linux-headers
RUN luarocks-5.1 install lua-cjson && \
    luarocks-5.1 install luasocket && \
    luarocks-5.1 install penlight
WORKDIR /tmp
RUN curl https://github.com/wg/wrk/archive/refs/heads/master.zip -L -o wrk.zip && \
    unzip wrk.zip && \
    cd wrk-master && \
    make

FROM alpine:edge
LABEL maintainer="Narate Ketram <r8@dome.cloud>"

RUN apk --update --no-cache add libgcc
WORKDIR /wrk
COPY --from=build /usr/local/share/lua /usr/local/share/lua
COPY --from=build /usr/local/lib/lua /usr/local/lib/lua
COPY --from=build /tmp/wrk-master/wrk /bin/wrk

ENTRYPOINT ["/bin/wrk"]
