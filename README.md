# Sourcecred Action

[![GitHub actions status](https://github.com/sourcecred/sourcecred-action/workflows/pull-request-sourcecred/badge.svg?branch=master)](https://github.com/sourcecred/sourcecred-action/actions?query=branch%3Amaster+workflow%3Apull-request-sourcecred)

This is a GitHub action to generate a beautiful [sourcecred](https://www.github.com/sourcecred/sourcecred)
contributors graphic, using the sourcecred [widgets](https://www.github.com/sourcecred/widgets) containers. The git history for this repository is fairly limited, but with more contributors the graphic below would be much more substantial!

![contributors.svg](./contributors.svg)

## 1. Choose your workflow

There are currently two derivations of the same workflow:

 - [.github/workflows/pull_request.yml](.github/workflows/pull_request.yml) can be added to your repository to run a scheduled job to open a pull request to update the graphic. This strategy allows you to review the changes by opening a new branch with the updated graphic, and is ideal if you don't want your repository being updated automatically. If you use this method, you'll also need to add the [.github/workflows/pull_request.sh](.github/workflows/pull_request.sh) file in the same folder.
 - [.github/workflows/automated.yml](.github/workflows/automated.yml) runs the same logic, but pushes directly to a branch of your choosing (gh-pages for the repository here, and you can change this with the `UPDATE_BRANCH` variable.

## 2. Customize

### pull_request.yml and automated.yml

 - **time**: you might want to adjust the cron frequency to be run at a rate that works for you . The pull request example is set to run on a weekly basis, and the automated example runs nightly at 2:30am, pushing to github pages.
 - **filename**: the graphic is saved as contributors.svg at the root of the repository, and you can change this if desired.

### pull_request.yml

You might want to customize the workflow in the following ways:

 - **script for PR**: The script to open the pull request is obtained from [here](https://gist.githubusercontent.com/vsoch/074f4895e52f7fa0574a3a7a51d5c9d8/raw/ddfedf86abd2b78332b955325d5d93f37d1353b4/pull_request.sh). If you want more control over this script (or just to keep it alongside your repository) you can add it to your repository, and then interact with it directly during the Action.
 - **branches**: currently the pull request is done via a created branch called update/sourcecred-<date> and then done against master. You can update the Action to adjust these values.

### automated.yml

 - **branch** You can customize the branch that is pushed to by changing `UPDATE_BRANCH`.


### README

Likely after the first graphic generation, you will want to add a link for it
to render in your README.md, as is done here.

```
![contributors.svg](./contributors.svg)
```

You can also use the example badge to add a badge for your GitHub action.
Happy hacking!
