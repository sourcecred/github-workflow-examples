# Sourcecred Example Workflows

[![GitHub actions status](https://github.com/sourcecred/github-workflow-examples/workflows/contributors-pull-request/badge.svg?branch=master)](https://github.com/sourcecred/github-workflow-examples/actions?query=branch%3Amaster+workflow%3Acontributors-pull-request)

This is a repository with example GitHub workflows for generating [sourcecred](https://www.github.com/sourcecred/sourcecred) 
graphics and prototypes. Specifically, we use the sourcecred [development](https://hub.docker.com/r/sourcecred/sourcecred) and [widgets](https://www.github.com/sourcecred/widgets) containers to generate either a single graphic, or an entire [web interface](https://sourcecred.io/github-workflow-examples/timeline/sourcecred/github-workflow-examples/) to show
contributions to your repository. You can choose to either generate a contributors graphic, or a prototype.

 - [Generate a Contributors Graphic](#generate-a-contributors-graphic)
 - [Generate a Sourcecred Prototype](#generate-a-sourcecred-prototype)
 - [See Examples in the Wild](#see-examples-in-the-wild)

## Generate a Contributor's Graphic

This is what a contributors graphic looks like:

![contributors.svg](./contributors.svg)

Essentially, we use sourcecred metrics to create a user profile collage based on the top contributors to your repository, as
determined by a SourceCred contribution graph. The git history for this repository is fairly limited, but with more contributors the graphic above would be much more substantial! If you've decided to choose generation of this graphic, you next need to choose a workflow.

### 1. Choose your workflow

There are currently two derivations of the same workflow:

 - [.github/workflows/contributors_pull_request.yml](.github/workflows/contributors_pull_request.yml) can be added to your repository to run a scheduled job to open a pull request to update the graphic. This strategy allows you to review the changes by opening a new branch with the updated graphic, and is ideal if you don't want your repository being updated automatically. If you use this method, you'll also need to add the [.github/workflows/pull_request.sh](.github/workflows/pull_request.sh) file in the same folder.
 - [.github/workflows/contributors_automated.yml](.github/workflows/contributors_automated.yml) runs the same logic, but pushes directly to a branch of your choosing (you can change this with the `UPDATE_BRANCH` variable.

### 2. Customize

#### contributors_pull_request.yml and contributors_automated.yml

 - **time**: you might want to adjust the cron frequency to be run at a rate that works for you . The pull request example is set to run on a weekly basis, and the automated example runs nightly at 2:30am.
 - **filename**: the graphic is saved as contributors.svg at the root of the repository, and you can change this if desired.

#### contributors_pull_request.yml

You might want to customize the workflow in the following ways:

 - **script for PR**: The script to open the pull request is kept alongside the workflows, and referenced by sha. If you are a developer and need to update the pull_request.sh script, make sure to update the sha as well.
 - **branches**: currently the pull request is done via a created branch called update/sourcecred-contributors-<date> and then done against master. You can update the Action to adjust these values.
 - **auto-delete**: If you choose to open new branches, you might want to consider enabling "Auto delete head branches" in your repository settings. This will delete branches after merge.

#### contributors_automated.yml

 - **branch** You can customize the branch that is pushed to by changing `UPDATE_BRANCH`. Currently we push to "contributors-automated" but you might imagine wanting to push an updated graphic to some web interface to display it.

## 3. Cache

Currently, we cache the "sourcecred_data" folder is the root of the repository that contains
previously extracted metadata about contributions. For most cases, this will assist to run
the action more quickly, however if you find that a different version of `sourcecred/sourcecred:dev`
is being used (and either outputs an error, or your contribution plot seems off) you can manually
invalidate the cache by removing this folder entirely before running the containers:

```bash
rm -rf sourcecred_data
mkdir -p sourcecred_data
```

The updated data will then be saved again to the cache.

### 4. README

Likely after the first graphic generation, you will want to add a link for it
to render in your README.md, as is done here.

```
![contributors.svg](./contributors.svg)
```

You can also use the example badge at the top of the README.md to add a badge for your GitHub action.
Happy hacking!

## Generate a SourceCred Prototype

A more substantial tool is the [sourcecred prototype](https://sourcecred.io/cred/timeline/@sourcecred/),
which includes an interactive graph for your repository. The repository here deploys an [example](https://sourcecred.io/github-workflow-examples/timeline/sourcecred/github-workflow-examples/) web interface on its GitHub pages.

### 1. Choose your workflow

There are also two derivations of this same workflow:

 - [.github/workflows/prototype_pull_request.yml](.github/workflows/prototype_pull_request.yml) can be added to your repository to run a scheduled job to open a pull request to generate static prototype files in the [docs](docs) folder. The idea would then be to deploy the docs folder on master branch to GitHub Pages. If you use this method, you'll also need to add the [.github/workflows/pull_request.sh](.github/workflows/pull_request.sh) file in the same folder.
 - [.github/workflows/prototype_automated.yml](.github/workflows/prototype_automated.yml) is the same thing, but done in an automated fashion.

### 2. Customize

#### prototype_pull_request.yml and prototype_automated.yml

 - **time**: you might want to adjust the cron frequency to be run at a rate that works for you . The pull request example is set to run on a weekly basis, and the automated example runs nightly at 2:30am.
 - **output**: Output is default directed to a docs folder, and the idea is that you would deploy this on GitHub pages. You could also change the logic to have static files in the root of the repository, if desired.

#### prototype_pull_request.yml

You might want to customize the workflow in the following ways:

 - **script for PR**: The script to open the pull request is kept alongside the workflows, and referenced by sha. If you are a developer and need to update the pull_request.sh script, make sure to update the sha as well.
 - **branches**: currently the pull request is done via a created branch called update/sourcecred-prototype-<date> and then done against master. You can update the Action to adjust these values.
 - **auto-delete**: If you choose to open new branches, you might want to consider enabling "Auto delete head branches" in your repository settings. This will delete branches after merge.

#### prototype_automated.yml

 - **branch** You can customize the branch that is pushed to by changing `UPDATE_BRANCH`. Currently we push to "master" but you might imagine wanting to push the entire static content to gh-pages (or somewhere else).

## See Examples in the Wild

The following repositories are deploying these pipelines to generate graphics:

 - [singularityhub/sregistry](https://github.com/singularityhub/sregistry): runs once a month to generate a contributor's graphic for the readme
 - [usrse/usrse.github.io](https://github.com/usrse/usrse.github.io): runs once a week to generate a contributor's graphic for the readme


Have you used a workflow here and want to add your repository to show? [Please open an issue!](https://github.com/sourcecred/github-workflow-examples/issues)
