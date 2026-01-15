
# Make your Helm Chart available on github.

## 1. Package Your Chart

First, let's package our package:

    helm package <path_to_chart>/helm/

## 2. Generate the Index File

Create an index file to tell Helm about available charts:

    helm repo index .

This generates index.yaml.

## 3. Push to GitHub

Upload everything to GitHub:

    git push

## 4. Configure Helm

Add the repository to your local Helm configuration:

    helm repo add \
        --username your-github-username \
        --password your-github-token 
    <your-repo-name>> 'https://raw.githubusercontent.com/<your-username>/repo-name/master'

Update the repository information:

    helm repo update