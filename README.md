# Polyglot Bazel Nix Monorepo
<strong>A Nixified fork of kriscfoster/multi-language-bazel-monorepo</strong>

I wanted to take a multi-language monorepo that was already using [bazel](https://bazel.build/) and update it to integrate Nix to enable reproducible development environments. Luckily @kriscfoster had already created a multi-language monorepo, so this fork will attempt to integrate Nix and create a good baseline development environment.

The goal is to support development in linux compatible environments,  including:
- <strong>Linux (most, if not all, flavors)
- Windows running WSL2
- MacOS (required for any iOS development)</strong>

## Prerequisites
Since the whole point here is to automate the dev environment there are only a few components required to be on your system.
1. [devenv](https://devenv.sh/getting-started/) - following their guide will install all items in this list
1. [nix](https://nixos.org/download.html)
1. [direnv](https://direnv.net/docs/installation.html) - comes pre-installed on some systems


# *** CURRENT STATUS -> Nixified Java Project DOES NOT BUILD ***

## Useful Commands
For now I'm leaving the commands here that @kriscfoster listed. It's not clear if some of them may need to be updated once Nix has been fully integrated, but will updated them as needed.

### Build all targets

- `bazel build //...`

### Test all test targets

- `bazel test //...`

### Sync Go Dependencies with `go.mod`

- `bazel run //:gazelle-update-repos`

### Format BUILD.bazel files (completely generates BUILd.bazel files for go projects)

- `bazel run //:gazelle`

### Run Python web app

- `bazel run //projects/python_web`
- http://localhost:5000

### Run Go web app

- `bazel run //projects/go_web`
- http://localhost:8080

### Run NodeJS web app

- `bazel run //projects/node_web`
- http://localhost:8080

### Run TypeScript app

- `bazel run //projects/ts_app`

### Run React app

- `bazel run //projects/react_app:start`

### Build & Run NodeJS web app docker image
```
➜ bazel run projects/node_web:node_web_image --@io_bazel_rules_docker//transitions:enable=yes -- --norun
...
INFO: Build completed successfully, 1 total action
Loaded image ID: sha256:XXX
Tagging YYY as bazel/projects/node_web:node_web_image
➜
➜ docker run -p 8080:8080 bazel/projects/node_web:node_web_image
listening on port 8080
```

### Build & Run Go web app docker image
```
➜ bazel run projects/go_web:go_web_image --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 -- --norun
...
INFO: Build completed successfully, 1 total action
Loaded image ID: sha256:XXX
Tagging YYY as bazel/projects/go_web:go_web_image
➜
➜ docker run -p 8080:8080 bazel/projects/go_web:go_web_image
2022/05/30 20:35:51 Going to listen on port 8080
```

### Build & Run Go web app docker image (custom base)
```
➜ bazel run projects/go_web:go_web_image_custom_base --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 -- --norun
...
INFO: Build completed successfully, 1 total action
Loaded image ID: sha256:XXX
Tagging YYY as bazel/projects/go_web:go_web_image_custom_base
➜
➜ docker run -p 8080:880 bazel/projects/go_web:go_web_image_custom_base
2023/03/15 21:29:46 Going to listen on port 8080
```

### Build & Run Python web app docker image
```
➜ bazel run projects/python_web:python_web_image -- --norun
...
INFO: Build completed successfully, 1 total action
Loaded image ID: sha256:XXX
Tagging YYY as bazel/projects/python_web:python_web_image
➜
➜ docker run -p 5000:5000 bazel/projects/python_web:python_web_image
...
* Running on http://127.0.0.1:5000
```

### Publishing Python web app docker image
```
➜ bazel run projects/python_web:publish         
...
INFO: Build completed successfully, 1 total action
2022/06/24 20:13:33 Successfully pushed Docker image to registry.hub.docker.com/krisfoster96/monorepo-python-web:1 - registry.hub.docker.com/krisfoster96/monorepo-python-web@sha256:024bcf5dd677d6fbce32fcf9d09329f4c80931cc12c90965bb397af1f497bf39
```

### Deploying Go web app to Heroku

```
➜ bazel** run projects/go_web:bazoku-deployment --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64
...
```
