# Table of Contents

-   [About](#about)
-   [Prerequisite](#prerequisite)
    -   [Tools](#tools)
    -   [Third party tools](#third-party-tools)
-   [Installation](#installation)
    -   [Download from dockerhub](#download-from-dockerhub)
    -   [Build from chiselapp (fossil)](#build-from-chiselapp--fossil-)
    -   [Build from github](#build-from-github)
-   [Configuration options](#configuration-options)
    -   [General options](#general-options)
    -   [Timezone](#timezone)
-   [Continues Integration](#continues-integration)
-   [Troubleshooting](#troubleshooting)
    -   [Log output](#log-output)
    -   [Shell access](#shell-access)



<a id="about"></a>

# About

This is [alt base docker image](https://hub.docker.com/_/alt) using [s6-overlay](https://github.com/just-containers/s6-overlay).

Alt-s6 is self-hosting at <https://chiselapp.com/user/oupfiz5/repository/alt-s6>.

If you are reading this on GitHub, then you are looking at a Git mirror of the self-hosting Alt-s6 repository.  The purpose of that mirror is to test and exercise Fossil's ability to export a Git mirror and using Github CI/CD  (Github Actions). Nobody much uses the GitHub mirror, except to verify that the mirror logic works. If you want to know more about Alt-s6, visit the official self-hosting site linked above.


<a id="prerequisite"></a>

# Prerequisite


<a id="tools"></a>

## Tools

1.  \*nix operation system
2.  Install Docker
3.  Install git (optional)
4.  Install fossil (optional)


<a id="third-party-tools"></a>

## Third party tools

They are using for testing and scanning:

1.  [Bats](https://github.com/bats-core)
2.  [Shellcheck](https://www.shellcheck.net/)
3.  [Hadolynt](https://github.com/hadolint/hadolint)
4.  [Dockle](https://github.com/goodwithtech/dockle)
5.  Snyk - not necessarily
6.  Trivy - not necessarily


<a id="installation"></a>

# Installation


<a id="download-from-dockerhub"></a>

## Download from dockerhub

    docker pull oupfiz5/alt-s6:sisyphus-3.1.0.0


<a id="build-from-chiselapp--fossil-"></a>

## Build from chiselapp (fossil)

    fossil clone https://chiselapp.com/user/oupfiz5/repository/alt-s6 alt-s6.fossil
    mkdir alt-s6
    cd alt-s6
    fossil open ../alt-s6.fossil
    docker build -t oupfiz5/alt-s6 .


<a id="build-from-github"></a>

## Build from github

    git clone https://github.com/oupfiz5/alt-s6.git
    cd alt-s6
    docker build -t oupfiz5/alt-s6 .


<a id="configuration-options"></a>

# Configuration options


<a id="general-options"></a>

## General options

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Option</th>
<th scope="col" class="org-left">Default</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">TZ</td>
<td class="org-left">UTC</td>
<td class="org-left">Set timezone, example Europe/Moscow</td>
</tr>
</tbody>
</table>


<a id="timezone"></a>

## Timezone

Set the timezone for the container, defaults to UTC. To set the timezone set the desired timezone with the variable TZ.

    docker run -itd --restart always \
               --name alt-s6  \
               --env 'TZ=Europe/Moscow' \
               oupfiz5/alt-s6:sisyphus-3.1.0.1


<a id="continues-integration"></a>

# Continues Integration

For  build and push docker images we use  [Github Actions workflow](https://github.com/oupfiz5/ubuntu-s6/blob/master/.github/workflows/on-push.yaml). Flow process is [GitHub flow](https://guides.github.com/introduction/flow/).


<a id="troubleshooting"></a>

# Troubleshooting


<a id="log-output"></a>

## Log output

For debugging and maintenance purposes you may want access the output log. If you are using Docker version 1.3.0 or higher you can access a running containers shell by starting bash using docker interactive:

    docker run -it --rm \
           --name=alt-s6 \
           oupfiz5/alt-s6:sisyphus-3.1.0.1


<a id="shell-access"></a>

## Shell access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version 1.3.0 or higher you can access a running containers shell by starting bash using docker exec:

    docker exec -it alt-s6 /bin/bash
