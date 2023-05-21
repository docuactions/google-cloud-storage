# 🦖 Deploy Docusaurus to Google Cloud Storage
This action allows you to deploy a Docusaurus site to Google Cloud Storage. It syncs a directory with a remote Google Cloud Storage bucket using the `gsutil` command-line tool. The directory can come from your repository or be created as part of your process. Additionally, it executes the `yarn run build` command to prepare the Docusaurus site for deployment.

## Usage

### `main.yml` Example

Place the following code in a `.yml` file, such as `main.yml`, in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```yaml
name: 🦕 Deploy Docusaurus to Google Cloud Storage
on: [push]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: docuactions/aws-s3@master
        env:
          GCS_BUCKET: ${{ secrets.GCS_BUCKET }}
          GCS_SERVICE_KEY: ${{ secrets.GCS_SERVICE_KEY }}
```

## Configuration

The following settings must be passed as environment variables as shown in the example. Sensitive information, especially `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`, should be [set as encrypted secrets](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables) — otherwise, they'll be public to anyone browsing your repository's source code and CI logs.

| Key             | Value                                            | Suggested Type | Required | Notes |
|-----------------|--------------------------------------------------|----------------|----------|-------|
| GCS_BUCKET      | The bucket name you want to publish the site to. | `secret env`   | Yes      |       |
| GCS_SERVICE_KEY | The bucket name you want to publish the site to  | `secret env`   | Yes      |       |

## Credits
* [Henry Newman](https://github.com/henrynewman)