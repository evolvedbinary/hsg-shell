# hsg-shell

## Prerequisites

You need to have *ant*, *git* and *nodeJS* (version 10.0.0 or higher) installed.

### For Mac OS X

**Note: Installation via homebrew is deprecated since the support for latest node.js versions has been stopped.** 

With **[homebrew](http://brew.sh#install)** installed, do

    brew update && brew upgrade
    brew install ant git node@6

### Install global node packages

After node is installed just run

    npm install -g gulp bower

## Setup

1. Clone the repository

    `git clone https://github.com/HistoryAtState/hsg-shell.git`

1. Install dependencies for the front-end and automation tasks (`npm` & `bower`),
    Build and copy javascripts, fonts, css and images into the *resources* folder (`gulp`) and
    generate the *.xar-package* inside the *build* directory

    `ant`

1. Switch to the exist Dashboard

1. Install the package `build/hsg-shell-x.y.xar` with the Package Manager

1. Click on the *history.state.gov* icon on the eXist Dashboard

## Update

To create an up-to-date build package to install in eXistDB, this should do

    git pull && ant

## Optional: Install bootstrap documentation

- Clone [bootstrap](https://github.com/twbs/bootstrap) via `https://github.com/twbs/bootstrap.git`
- Install [Jekyll](http://jekyllrb.com/docs/installation/) to be able to view bootstrap docs locally: `gem install jekyll`
- See this tip for working around [jekyll installation errors](https://github.com/wayneeseguin/rvm/issues/2689#issuecomment-52753818) `brew unlink libyaml && brew link libyaml`
- In the bootstrap clone directory, run `jekyll serve`, then view bootstrap documentation at http://localhost:9001/

## Development

`gulp build` builds the resource folder with fonts, optimized images, scripts and compiled styles

`gulp deploy` sends the resource folder to a local existDB

`gulp watch` will upload the build files whenever a source file changes.

**NOTE:** For the deploy and watch task you may have to edit the DB credentials in `gulpfile.js`.

## Build

`ant` builds XAR file after running npm install bower install and gulp (build)

## How to update Node and other build & development tools

In order to build a xar package of the app with `ant` and to run scripts, that will build the app files like ie. minified css, js, you'll need to install `node.js`, `npm` and `gulp` in certain versions, that will be specified in this projects `package.json` and `npm-shrinkwrap.json` (for dependency locks).  

### Update node and npm versions

1. Update your system to `node v10.0.0` either via using [nvm](https://github.com/nvm-sh/nvm), or directly from the [node website](https://nodejs.org/en/).
1. Check your current node version with `node --version`, it should be `v10.0.0` now.
1. Install (or update to) the latest `npm` version with `npm install -g npm`.
1. Install bower `npm install -g bower`.
1. Install gulp `npm install -g gulp`. The project's gulp file depends on `gulp 4` (or higher) syntax, so make sure in the next step, that you'll have gulp 4.x running.
1. Check the paths, where your node, npm and gulp have been installed (depends on OS) by running `which node`,
`which npm`, `which gulp`.
1. Look for file `example.local.build.properties`, copy it, rename it to `local.build.properties` and insert the current paths you just got by running the "which" commands. This file is necessary for pointing the ant task runner to the necessary build tools.
1. Install the node packages (listed in file `package.json`) by running `npm install` .
1. If npm errors occur, try fix it either by running `npm update`, or by
deleting the entire `node_modules` folder from the project and then running `npm install` once again.
1. Last, you may have to edit the credentials in file `local.node-exist.json` which is needed for configure the automated deployment of files from your local HSG-Shell project to your local existdb. The defaults in this file will generally apply here, unless you have modified the credentials elsewhere.

### Finally check currently installed versions
1. node: `node -v` => Should output `v10.0.0`
2. npm: `npm -v` => Should output at least `v6.9.0`
3. gulp: `gulp -v` => Should output at least `CLI version: 2.2.0, Local version: 4.0.2`

Now, with a running existdb you're ready to run either `ant` or `gulp` to test if your update was successful.

### Production

If `NODE_ENV` environment variable is set to **production** the XAR is build with
minified and concatenated styles and scripts. This build will then include
google-analytics and DAP tracking.

`NODE_ENV=production ant` for a single test

`export NODE_ENV` in the login script on a production server
