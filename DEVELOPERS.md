# Developer Guide

## Local Development

```bash
just run
```

This builds the SDK, launches a test workshop, and shells in.

## Running Tests

```bash
just test
```

Runs spread tests via `sdkcraft test`.

## Branch Model

| Branch | Purpose | Contains |
|--------|---------|----------|
| `main` | Template branch | renovate.json, Renovate workflows, no VERSION |
| `latest` | Buildable version branch | VERSION, build/upload workflows |

Renovate runs from `main` and opens PRs against `latest` when upstream releases new versions.

## Updating to Latest Upstream

```bash
just update
```

Checks casey/just for new releases and updates VERSION if needed.

## Store Credentials for CI

### 1. Log in locally

```bash
sdkcraft login
```

### 2. Extract credentials from keyring

```bash
just export-credentials
```

### 3. Add to GitHub

Go to repository Settings → Secrets and variables → Actions → New repository secret.

- Name: `SDKCRAFT_STORE_CREDENTIALS_STAGING`
- Value: paste the credential string from step 2

## Registering the SDK

Before the first upload, register the SDK name:

```bash
sdkcraft register just
```

## Manual Release

```bash
just release
```

Packs and uploads amd64 + arm64 to `latest/stable`.
