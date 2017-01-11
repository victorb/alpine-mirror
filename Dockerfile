FROM alpine:3.4
ENV HASH "QmRsvEpJggeu4HhoafzRFobV4sbwVVTXMrdb2p8XWv7bCS"
RUN sed -i -- "s/http:\/\/dl-cdn.alpinelinux.org\/alpine/https:\/\/ipfs.io\/ipfs\/$HASH/g" /etc/apk/repositories
RUN apk update
RUN apk add --no-cache bash
CMD ["bash", "-c"]
