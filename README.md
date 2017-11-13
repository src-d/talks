# source{d} Tech Talks pages
[![Build Status](https://drone.srcd.host/api/badges/src-d/talks/status.svg)](https://drone.srcd.host/src-d/talks)
[![Docker Repository on Quay](https://quay.io/repository/srcd/talks/status "Docker Repository on Quay")](https://quay.io/repository/srcd/talks)

This project lets you to create new source{d} talks running one single command. Each talk uses the [Project Zeppelin](CONTRIBUTING.md#project-zeppelin) as a blueprint and is stored under a dedicated directory as it was a single site. Read more about the architecture of the project in the [Architecture](CONTRIBUTING.md#site-architecture) section

# Requirements

To build, run and create new talks you need:

- [Ruby](https://www.ruby-lang.org/es/)
- [Jekyll](https://jekyllrb.com/) to build the static sites from plain text definitions,
- [Bundler](http://bundler.io) to manage the ruby gems required by the project
- [Yarn](https://yarnpkg.com/en/docs/install) to handle the js dependencies and locally run the project 
- [Caddy](https://caddyserver.com) to serve the static files in production

# Build

You need to satisfy the [project requirements](#requirements), and then run from the project root:

```shell
make build;
```

It will generate all the static files under `_site` directory which will be served by the Caddy server from the docker image.

# Preview the talks

To locally serve the blog, you need to satisfy the [project requirements](#requirements), and then run from the project root:

```shell
make serve;
```
Finally, go to [http://localhost:8484](http://localhost:8484)

In case you want to develop over a talk, and preview and quick-refresh only that one, you should read the [Preview a talks](CONTRIBUTING.md#preview-a-talk) section

# Contributing

If you want to contribute to this project, or to write or edit a blog post, you will find more info in the [contribution guidelines](CONTRIBUTING.md).

## License

MIT License, see [LICENSE](LICENSE)
