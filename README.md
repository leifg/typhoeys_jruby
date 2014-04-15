# Typhoeus and JRuby

With this repo to reproduce the [FFI/LibCurl buffer overflow bug](https://github.com/jruby/jruby/issues/752)

## Usage

  - install JRuby (tested with JRuby 1.7.11 which is already in the .ruby-version)
  - `bundle install`
  - `bundle exec ruby run.rb`

### Parameters

Through the environment variable `LIVE` and `ITERATIONS` it is possible to vary the size of the parallel requests and the number of iterations (default is 200 and 50)

```shell
SIZE=100 ITERATIONS=500 bundle exec ruby run.rb
```
