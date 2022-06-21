# Github Action: Packer Build on Google Compute Engine

This is a custom Github Action to build Packer Images on Cloud. This only has support for GCP as of now but we'll add support for AWS and Azure as well.

## Inputs

This action currently supports 3 input variables.

- **main_file(json)**: This is the configuration file which contains your Packer configuration.
- **variable_file(json)**: This is the file which contains all the variables needed by your main configuration file.
- **working_directory**: This is the directory which contains your packer configuration code relative to the root of your repository. Defaults to root directory(.)in the repository

## Authentication

For this Github action to work, you need to have checked out the repository in your Github Actions runner and configured authentication with GCP.

To configure authentication with GCP, you can either use Workload Identity Federation(recommended) or use a long-lived Service Account Key to impersonate a GCP Service Account.

Please refer to [Google Auth](https://github.com/google-github-actions/auth) repository.

## Sample Usage

```bash
name: Build Packer Image on GCP
on:
  push:
    branches: [master]

jobs:
  packer-build:
    runs-on: ubuntu-latest
    steps:

    # Checking out the source Code
      - name: Checkout the Source Code
        uses: "actions/checkout@v3"

      - name: Configure Authentication with GCP
        uses: "google-github-actions/auth@v0"
        with:
          credentials_json: "${{ secrets.ACTIONS_SA_KEY }}"

      - name: Build AMI
        uses: "rastogiji/gcp-packer-github-actions@v1.0.0-beta"
        with:
          main_file: main.json
          variable_file: variables.json
          working_directory: packer/

```

Pull Requests are welcome. We are trying to add support for AWS and Azure.

## LICENSE

[MIT]()
