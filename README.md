# setup-mc

## Example

```yml
name: CI

on:
  push:
    tags:
      - v*

jobs:
  build:
    steps:
      - name: Set up MinIO Client
        run: curl -fsSL "https://raw.githubusercontent.com/tai-kun/setup-mc/refs/tags/$TAG/main.sh" | bash
        env:
          # https://github.com/tai-kun/setup-mc/tags
          # e.g. v0.1.0
          TAG: <tai-kun/setup-mc version>
          ALIAS: r2
          ENDPOINT_URL: ${{ secrets.R2_ENDPOINT_URL }}
          ACCESS_KEY_ID: ${{ secrets.R2_ACCESS_KEY_ID }}
          SECRET_ACCESS_KEY: ${{ secrets.R2_SECRET_ACCESS_KEY }}

      - name: Upload
        run: mc cp out 'r2/my-bucket/build/out-${{ github.ref_name }}-${{ runner.os }}-${{ runner.arch }}'
```
