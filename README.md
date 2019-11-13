# setup-gleam

[![](https://github.com/gleam-lang/setup-gleam/workflows/Test/badge.svg)](https://github.com/gleam-lang/setup-gleam/actions)
[![](https://github.com/gleam-lang/setup-gleam/workflows/Licensed/badge.svg)](https://github.com/gleam-lang/setup-gleam/actions)

This actions sets up a Gleam environment for use in Actions by:

- Installing OTP
- Installing Gleam

**Note** Currently, this action currently only supports Actions' `ubuntu-` runtimes.

## Usage

See [action.yml](action.yml).

**Note** The OTP release version specification is [relatively
complex](http://erlang.org/doc/system_principles/versions.html#version-scheme).
For best results, the current recommendation is to use a full exact version
spec from the list available from [Erlang
Solutions](https://www.erlang-solutions.com/resources/download.html).

### Basic example

```yaml
on: push

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1.0.0
      - uses: gleam-lang/setup-gleam@v1.0.0
        with:
          otp-version: 22.x
          gleam-version: 0.4.x
      - run: rebar3 install_deps
      - run: rebar3 eunit
```

### Matrix example

```yaml
on: push

jobs:
  test:
    runs-on: ubuntu-latest
    name: OTP ${{matrix.otp}} / Gleam ${{matrix.gleam}}
    strategy:
      matrix:
        otp: [20.x, 21.x, 22.x]
        gleam: [0.4.1]
    steps:
      - uses: actions/checkout@v1.0.0
      - uses: gleam-lang/setup-gleam@v1.0.0
        with:
          otp-version: ${{matrix.otp}}
          gleam-version: ${{matrix.gleam}}
      - run: rebar3 install_deps
      - run: rebar3 eunit
```

### Postgresql example

```yaml
on: push

jobs:
  test:
    runs-on: ubuntu-latest

    services:
      db:
        image: postgres:11
        ports: ['5432:5432']
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5

    steps:
      - uses: actions/checkout@v1.0.0
      - uses: gleam-lang/setup-gleam@v1.0.0
        with:
          otp-version: 22.x
          gleam-version: 0.4.x
      - run: rebar3 install_deps
      - run: rebar3 eunit
```

## License

The scripts and documentation in this project are released under the [MIT license](LICENSE.md).

## Contributing

Check out [this doc](CONTRIBUTING.md).

## Current Status

This action is in active development.
