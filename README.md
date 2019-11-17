# setup-gleam

[![](https://github.com/gleam-lang/setup-gleam/workflows/Test/badge.svg)](https://github.com/gleam-lang/setup-gleam/actions)

A GitHub action that installs the Gleam compiler for use in your CI workflow.

Most likely you'll want to use this with another action to install the
Erlang/OTP runtime.

## Usage

### Basic example

```yaml
on: push

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1.0.0
      - uses: gleam-lang/setup-erlang@v1.0.0
        with:
          otp-version: 22.1
      - uses: gleam-lang/setup-gleam@v1.0.0
        with:
          gleam-version: 0.4.1
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
        otp: [22.1, 21.3]
        gleam: [0.4.1, 0.4.0]
    steps:
      - uses: actions/checkout@v1.0.0
      - uses: gleam-lang/setup-erlang@v1.0.0
        with:
          otp-version: ${{matrix.otp}}
      - uses: gleam-lang/setup-gleam@v1.0.0
        with:
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
      - uses: gleam-lang/setup-erlang@v1.0.0
        with:
          otp-version: 22.1
      - uses: gleam-lang/setup-gleam@v1.0.0
        with:
          gleam-version: 0.4.1
      - run: rebar3 install_deps
      - run: rebar3 eunit
```
