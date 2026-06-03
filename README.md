# Just SDK for Workshop

This SDK provides Just, a handy command runner for saving and executing
project-specific commands. Just uses justfiles to define recipes—commands that
can be run from any subdirectory of your project. Bash completions are
automatically configured.

---

## Reference workshop

A minimal workshop:

```yaml
# workshop.yaml
name: my-project
base: ubuntu@24.04
sdks:
  - name: just
    channel: latest/stable

actions:
  build: |
    just build
```

This demonstrates using Just to run project commands defined in a justfile.

---

## Using the SDK

### Prerequisites, project layout

1. No prerequisite SDKs are required.
2. Create a `justfile` in your project root with your recipes:

   ```just
   # justfile
   default:
       @echo 'Hello, world!'

   build:
       cargo build --release

   test:
       cargo test

   clean:
       cargo clean
   ```

3. On launch, Just is added to PATH and bash completions are configured.

### Running recipes

Once the workshop is ready:

```bash
workshop shell
just              # runs the default recipe
just build        # runs a specific recipe
just --list       # lists available recipes
```

### Using Just from workshop actions

Define workshop actions that call Just recipes:

```yaml
# workshop.yaml
actions:
  build: |
    just build
  test: |
    just test
  clean: |
    just clean
```

Run from the host:

```bash
workshop run build
workshop run test
```

### Verify from the command line

```bash
workshop shell
just --version
```

---

## Plugs (resources this SDK consumes)

This SDK doesn't define any plugs.

## Slots (resources this SDK provides)

This SDK doesn't define any slots.

---

## Documentation and guidance

- [Just official documentation](https://just.systems/man/en/)
- [Just GitHub repository](https://github.com/casey/just)
- [Workshop documentation](https://ubuntu.com/workshop/docs/)

---

## Community and support

- Just community: [GitHub Discussions](https://github.com/casey/just/discussions)
- Workshop forum: [Discourse](https://discourse.ubuntu.com/)
- Please review our
  [Code of Conduct](https://ubuntu.com/community/ethos/code-of-conduct) before
  participating.

---

## Contributions

All contributions, including code, documentation updates, and issue reports,
are welcome!

- See `CONTRIBUTING.md` for guidelines.
- Open issues or pull requests on the official repository.

---

## License and copyright

Copyright 2026 Canonical Ltd.

This SDK is released under the license defined in [LICENSE](LICENSE).

Just is licensed under the [CC0-1.0](https://creativecommons.org/publicdomain/zero/1.0/).
