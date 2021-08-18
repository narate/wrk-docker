# wrk docker

wrk - [https://github.com/wg/wrk](https://github.com/wg/wrk)

# Build

```
docker build -t wrk .
```

# Run

```
$ docker run --rm wrk
Usage: wrk <options> <url>
  Options:
    -c, --connections <N>  Connections to keep open
    -d, --duration    <T>  Duration of test
    -t, --threads     <N>  Number of threads to use

    -s, --script      <S>  Load Lua script file
    -H, --header      <H>  Add header to request
        --latency          Print latency statistics
        --timeout     <T>  Socket/request timeout
    -v, --version          Print version details

  Numeric arguments may include a SI unit (1k, 1M, 1G)
  Time arguments may include a time unit (2s, 2m, 2h)

```

Or you can user docker image on docker hub `narate/wrk`