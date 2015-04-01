# Penlook Console

Build status

[![Build Status](https://travis-ci.org/penlook/console.svg?branch=master)](https://travis-ci.org/penlook/console) [![Software License](https://img.shields.io/badge/license-GNU-blue.svg?style=flat)](LICENSE.md) [![Author](http://img.shields.io/badge/author-penlook-red.svg?style=flat)](https://github.com/penlook)

### Installation

```bash
$ curl https://raw.githubusercontent.com/penlook/console/master/all.sh?$(date +%s) | sh
```

### Synopsis

```bash
$ penlook <subcommand> <parameter>
```

### Sub Command

+ auth     : Server authentication by ssh key (implemented)
+ path	   : Penlook root directory (implemented)
+ clone    : Initialize project (implemented)
+ update   : Pull all repositories (not yet implemented)
+ build    : Build all submodules  (implemeting)
+ test     : Run unit and integration tests (implemented)
+ deploy   : Deploy directly to development server (not yet implemented)
+ backup   : Create backup for source code and database (not yet implemented)
+ server   : Server instances management (implementing)
+ storage  : Storage management (not yet implemented)
+ config   : Build configuration file (implemented)
+ setup    : Setup development environment (implemented for development)
+ clean    : Cleanup project (not yet implemented)
+ help     : Help command (implemented)
+ version  : Current version of Penlook (implemented)

### Instruction for developers

+ Reference synopsis in console documentation
```
https://github.com/penlook/console#synopsis
```

+ Install penlook console
```bash
$ curl https://raw.githubusercontent.com/penlook/console/master/all.sh?$(date +%s) | sh
```

+ SSH Authentication with Github
```bash
$ penlook auth yourname@penlook.com
```

+ Test authentication successful or failure
```bash
$ penlook auth test
```

+ Setup development environment
```bash
$ penlook setup development
```

+ Notice: If you are using koding vps, your vps information will have these SSH informations:
```bash
IP Address: yourname.koding.io
Username  : yourname
Password  : root
```

+ Clone one repository from Github
```bash
$ penlook clone service
```

+ Test a repository (implementing)
```bash
$ penlook test service
```

+ Build a repository (implementing)
```bash
$ penlook build service
```

### Documentation

+ Create ssh key authentication
```bash
$ penlook auth @email
```

+ View current public key
```bash
$ penlook auth key
```

+ Clear ssh key of current user
```bash
$ penlook auth clear
```

+ Test authentication with server
```bash
$ penlook auth test
```

+ Clone project from github
```bash
$ penlook clone
```

+ Upate project source code
```bash
$ penlook update
```

+ Config project
```bash
$ penlook config
```

+ Deloy project to instance network
```bash
$ penlook deploy
```

+ Deploy project to development server
```bash
$ penlook deploy master
```

+ Deploy project to worker server
```bash
$ penlook deploy worker
```

+ List all instance in network
```bash
$ penlook server list
```

+ SSH into instance
```bash
$ penlook server ssh < instance_id >
```

+ Setup fresh installation for development server
```bash
$ penlook setup development
```

+ Setup fresh installation for production server (implementing)
```bash
$ penlook setup production
```

+ Setup fresh installation for database server (implementing)
```bash
$ penlook setup database
```

+ Run unit and integration test for all sub-project
```bash
$ penlook test
```

+ Run test per repository
```bash
$ penlook test <repository name>
```

+ Help command
```bash
$ penlook help
```

+ Penlook Cli version
```bash
$ penlook version
```
