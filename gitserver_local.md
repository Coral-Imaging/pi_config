## Why Setup Local Git Server on Central Computer?

Because of the lack of internet (or extremely low and unreliable wifi and mobile signal) in Room 11 where CSLICS are deployed, pulling changes from github.com is not an option. A better way forward is to make a local server on the laptop (which is connected to the internet), and add a second remote to each CSLICS's repos. Then you can make local changes on the pi, commit locally and push those changes to the laptop/central internet-connected computer. The internet-connected computer can then push those changes to github.com, where the main cloud repos exist for version control.

I mostly used this link as a guide: https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server

## setting up ssh keys from pi's on laptop

Set up ssh keys on the pi and importing them over to the central computer. `ssh key-gen -t rsa`. Copy over the id_rsa.pub contents to the `authorized_keys` file in the central computer in the `.ssh` folder (make one if it doesn't already exist). Each key should be a new line in the authorized_keys file.

## setting up local git server

Make a new directory on central computer to store all the repo info. Then for each repo, make the working tree. Replace `reponame` with name of repo, e.g. `coral_spawn_imager` or `coral_spawn_counter`.

    mkdir gitserver_cslics_local
    mkdir reponame.git
    cd reponame.git
    git init --bare

Note: this keeps track of all the files changes/etc, but doesn't actually show you the files in a readable way. To do this, we still want the code on the computer in a separate folder. Since the code already exists on our computer, we can just add a second remote to the existing git repos.

## cloning from local git server

Cloning from local git server works as normal. On the central CSLICS computer (the one that hosts the local git server), you can replace the ip addresds with `localhost`.

    git clone ssh://cslics@192.168.1.100:/home/cslics/gitserver_cslics_local/reponame.git

When doing so, I often get the error: 

    git clone ssh://cslics@192.168.1.100:/home/cslics/gitserver_cslics_local/coral_spawn_counter.git
    Cloning into 'coral_spawn_counter'...
    cslics@192.168.1.100's password: 
    remote: Enumerating objects: 544, done.
    remote: Counting objects: 100% (544/544), done.
    remote: Compressing objects: 100% (194/194), done.
    remote: Total 544 (delta 343), reused 536 (delta 337)
    Receiving objects: 100% (544/544), 73.96 MiB | 120.40 MiB/s, done.
    Resolving deltas: 100% (343/343), done.
    warning: remote HEAD refers to nonexistent ref, unable to checkout.

The latter is fine. Everything was cloned, but the HEAD is not yet populated. We just specify the HEAD.

    cd coral_spawn_counter

The repo appears empty.

    git checkout main

    Branch 'main' set up to track remote branch 'main' from 'origin'.
    Switched to a new branch 'main'

The repo is now populated. Huzzah!

## setting up a second remote

In the existing repo directory:

    git remote add localserver ssh://cslics@192.168.1.100:/home/cslics/gitserver_cslics_local/reponame.git

Using the second remote (instead of origin - which is the cloud github.com):

    git push/pull localserver main

The repos to be seconded are:

    git remote add localserver ssh://cslics@192.168.1.100:/home/cslics/gitserver_cslics_local/coral_spawn_imager.git
    git remote add localserver ssh://cslics@192.168.1.100:/home/cslics/gitserver_cslics_local/coral_spawn_counter.git
    git remote add localserver ssh://cslics@192.168.1.100:/home/cslics/gitserver_cslics_local/rrap-server.git
    git remote add localserver ssh://cslics@192.168.1.100:/home/cslics/gitserver_cslics_local/rrap-telem.git
    git remote add localserver ssh://cslics@192.168.1.100:/home/cslics/gitserver_cslics_local/rrap-scheduler.git

Note: might need to do so for machine-vision-toolbox-python and ultralytics_cslics in the future, but at the moment these are frozen for development.


