FROM golang AS build

WORKDIR /usr/src/app

COPY . .

RUN go build main.go

FROM scratch

COPY --from=build /usr/src/app .

ENTRYPOINT [ "./main" ]