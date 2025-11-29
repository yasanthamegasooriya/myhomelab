Usage: generate a kind config with dynamic host paths

This directory contains a templated `cluster.yaml` that uses `${HOST_ROOT}`
placeholders for host-mounted paths. To produce a concrete config that `kind`
can consume, run the generator script from the repo root.

Example (from repo root):

1. Generate using the default repo root as host root:

```
./scripts/generate-kind-config.sh
```

2. Or override the host root explicitly:

```
HOST_ROOT=/path/to/project ./scripts/generate-kind-config.sh
```

This produces `kindCluster/cluster.generated.yaml`. Create the cluster with:

```
kind create cluster --config kindCluster/cluster.generated.yaml
```

Notes:
- The script prefers `envsubst` for variable substitution; it falls back to `sed`
  if `envsubst` is not available.
- On macOS using Docker Desktop, verify that the host paths you mount are
  accessible to the Docker VM (Docker Desktop file sharing settings).
