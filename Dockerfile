# Estagio 1
FROM golang:1.21 AS build

WORKDIR /go/src/app
COPY /app .

RUN go mod download
#RUN go vet -v
#RUN go test -v

#RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/app



#RUN brew install upx 

ARG UM "app"
ENV DOIS /go/bin/app
RUN GOOS=linux go build -o $DOIS $UM && \
    GOOS=linux go build -ldflags="-s -w" -o $DOIS.-sw $UM
#RUN upx -f --brute -o $DOIS.upx $DOIS
#     upx -f --brute -o $DOIS.-sw.upx $DOIS.-sw && \
#     GOOS=linux gotip build -o $DOIS.tip "$UM" && \
#     GOOS=linux gotip build -ldflags="-s -w" -o $DOIS.tip.-sw "$UM" && \
#     upx -f --brute -o $DOIS.tip.upx $DOIS.tip && \
#     upx -f --brute -o $DOIS.tip.-sw.upx $DOIS.tip.-sw

# Estagio 2
#FROM gcr.io/distroless/static-debian11
FROM scratch

ENV DOIS /go/bin/app

COPY --from=build $DOIS .

# #CMD [ "app" ]
ENTRYPOINT [ "/app" ]