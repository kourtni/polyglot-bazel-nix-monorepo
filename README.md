# multi-language-bazel-monorepo

![getting started with bazel](https://user-images.githubusercontent.com/17026751/146653297-18db0708-f9e4-4bb3-ba2f-469be7774e25.png)

I wanted to try to set up a multi-language monorepo using [bazel](https://bazel.build/) for experimentation purposes. You can follow the journey on YouTube.

1. [Bazel Tutorial: (Part 1) Getting Started, Bazelisk & our First Build Targets](https://youtu.be/BZYj6yfA6Bs)

## setup instructions

### prerequisites

- [bazelisk installed](https://github.com/bazelbuild/bazelisk) (`brew install bazelisk` on mac) - bazel launcher that also manages the bazel installation & version using the [.bazelversion](./.bazelversion) file.

### running all builds

`bazel build //...`

### running all tests

`bazel test //...`
