# Sourcecred Action

[![GitHub actions status](https://github.com/sourcecred/sourcecred-action/Generate-SourceCred/badge.svg?branch=master)](https://github.com/sourcecred/sourcecred-action/actions?query=branch%3Amaster+workflow%3AGenerate-SourceCred)

This is a GitHub action to generate a beautiful [sourcecred](https://www.github.com/sourcecred/sourcecred)
contributors graphic, using the sourcecred [widgets](https://www.github.com/sourcecred/widgets) containers. The git history for this repository is fairly limited, but
with more contributors the graphic below would be much more substantial!

![contributors.png](./contributors.png)

## Usage

### Add the workflow

Add the [.github/workflows/generate.yml](.github/workflows/generate.yml) to your repository, along with the [.github/workflows/pull_request.sh](.github/workflows/pull_request.sh) in the same folder.

### Customize

You might want to customize the workflow in the following ways:

 - **time**: you might want to adjust the cron frequency to be run at a rate that works for you (currently it's done on a daily basis at 8am).
 - **script for PR**: The script to open the pull request is obtained from [here](https://gist.githubusercontent.com/vsoch/074f4895e52f7fa0574a3a7a51d5c9d8/raw/ddfedf86abd2b78332b955325d5d93f37d1353b4/pull_request.sh). If you want more control over this script (or just to keep it alongside your repository) you can add it to your repository, and then interact with it directly during the Action.
 - **branches**: currently the pull request is done via a created branch called update/sourcecred-<date> and then done against master. You can update the Action to adjust these values.
 - **filename**: the graphic is saved as contributors.png at the root of the repository, and you can change this if desired.

### README

Likely after the first graphic generation, you will want to add a link for it
to render in your README.md, as is done here.

```
![contributors.svg](./contributors.svg)
```

You can also use the example badge to add a badge for your GitHub action.
Happy hacking!
