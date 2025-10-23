<!-- vim: set filetype=markdown.markdown-toc : -->

# README

Instructions to setup an Incus container — `g1` — to learn Gleam with Exercism.

<!-- toc -->

- [Launch and keep a standard `vimfiles` container](#launch-and-keep-a-standard-vimfiles-container)
- [Rename from `c1` to `g1`](#rename-from-c1-to-g1)
- [Install packaged software](#install-packaged-software)
- [Install `dotfiles`](#install-dotfiles)
- [Start the first exercise](#start-the-first-exercise)
- [Optionally install packaged software for Dart](#optionally-install-packaged-software-for-dart)

<!-- tocstop -->

## Launch and keep a standard `vimfiles` container

[maxwell-k/vimfiles]: https://codeberg.org/maxwell-k/vimfiles

Commands to use [maxwell-k/vimfiles] to launch with a container with vim
configured:

    cd ~/.vim
    KEEP_C1=1 tests/incus

Command to take a snapshot:

    incus snapshot create c1 snapshot0

## Rename from `c1` to `g1`

Commands to stop, rename and restart `g1`:

    incus stop c1 \
    && incus rename c1 g1 \
    && incus start g1

Command to update the host name:

    incus exec g1 -- hostnamectl hostname g1

## Install packaged software

Command to check that Ansible can connect:

    ansible \
      --connection=community.general.incus \
      --inventory=g1, \
      --module-name ping \
      all

Command to run the playbook:

    ./site.yaml

## Install `dotfiles`

Command to start an interactive shell:

    incus exec g1 -- su --login maxwell-k

Follow the three steps in <https://github.com/maxwell-k/dotfiles/>

## Start the first exercise

Host commands to clone a repository to work in:

    cd ~/github.com/maxwell-k
    git clone git@github.com:maxwell-k/exercism.git

Host commands to add a bind-mount to `g1`:

    cd ~/github.com/maxwell-k/exercism \
    && incus config device add \
      g1 exercism disk "source=$PWD" "path=$PWD" shift=true

Container command to configure the above directory:

    exercism configure --workspace ~/github.com/maxwell-k/exercism

Command to download the first exercise:

    exercism download --track=gleam --exercise=hello-world

## Optionally install packaged software for Dart

Command to run the playbook:

    ./dart.yaml
