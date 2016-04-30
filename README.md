# Saltstack Masterless and Jenkins CI

#Salt Stack

[Salt](http://www.saltstack.com), a new approach to infrastructure management, is easy enough to get running in minutes, scalable enough to manage tens of thousands of servers, and fast enough to communicate with those servers in seconds.

Salt delivers a dynamic communication bus for infrastructures that can be used for orchestration, remote execution, configuration management and much more.

#Jenkins - Build great things at any scale

[Jenkins](https://jenkins.io/) is the leading open source automation server, Jenkins provides hundreds of plugins to support building, deploying and automating any project.

#Docker

[Docker](https://www.docker.com/) provides an integrated technology suite that enables development and IT operations teams to build, ship, and run distributed applications anywhere.

#What is this project about?

This project is a basic case study that demonstrates how could an environment be provided for building Android Apps using a Jenkins pre-built docker image running inside a salt infrastructure using Salt states to setup the docker environment.

The whole infrastructure is composed by a Salt Masterless Minion which has a few salt states applied. Those states will provide all the necessary modules for having a Jenkins container running and building an Android Job that points to a git hub repository which is just a [sample app](https://github.com/danieloliveira079/android-app-sample.git). 

The source code of the docker image used by this experiment can be found [here](https://github.com/danieloliveira079/jenkins-android) and the built image is available on the official docker hub accessing [https://hub.docker.com/r/danieloliv/jenkins-android/](https://hub.docker.com/r/danieloliv/jenkins-android/).

##Requirements

Before you start, please check if your machine has the following software installed. 

- [Vagrant](https://www.vagrantup.com)
- [Virtual Box](https://www.virtualbox.org/wiki/Downloads)

There is no need of having Docker installed on your local machine. Everything will be running totally isolated inside the VM and all the provisioning of softwares, packages and config files are hanled by the Vagrant cookbook which is specified by the [Vagrantfile](https://github.com/danieloliveira079/saltstack-jenkins/blob/master/Vagrantfile).

## How to get started

```$ git clone https://github.com/danieloliveira079/saltstack-jenkins.git```

```cd saltstack-jenkins```

##Bringing the VM Up

```$ vagrant up```

The Vagrantfile uses the [Salt Provisioner](https://www.vagrantup.com/docs/provisioning/salt.html) to bootstrap a masterless salt minion.

Vagrant will bring the virtual machine up and apply some provisioning steps:

- Copy config and state files for Salt
- Install python-pip and docker-py
- Apply the Salt states responsible for install the docker engine, download and start the docker image that contains the Jenkins and its dependencies. The Jenkins image brings inside it the Android SDK and a few updates.

## Applying Salt States

As part of the Salt lifecycle VMs (minions) can be managed by applying states. These states tell to the minions or example what mustbe uninstalled, installed or updated. Based on that approach during the provisioning phase there are two states being applied:

- Docker: Install the docker engine and all its dependencies
- Jenkins: Download the Jenkins image built specific for this projetc and start the container

Even though they are just 2 steps, there is a lot of data to be downloaded consequently this process will take some time to get done. Meanwhile you can read the Salt documentation just in case your are not much familiar with it.

## Start building

As soon as the previous steps get completed all you have to do is to point your browser to [http://192.168.99.101:8080](http://192.168.99.101:8080) and login using the following credentials:

Login: operations
Password: local12.

Your will notice that there is one pre configured Job ready to start. This job points to a [sample app](https://github.com/danieloliveira079/android-app-sample.git) that uses [Gradle](http://gradle.org/) to build and generate the .apk file.

