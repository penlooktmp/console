# Penlook Console

Build status

[![Build Status](https://travis-ci.org/penlook/service.svg?branch=master)](https://travis-ci.org/penlook/service) [![Software License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.md) [![Author](http://img.shields.io/badge/author-penlook-red.svg?style=flat)](https://github.com/penlook)

### Installation
```bash
curl https://raw.githubusercontent.com/penlook/console/master/install.sh | bash
```

### Sample CLI

```bash
penlook server list
penlook setup ubuntu
penlook clone backend
```

+ auth    : Server authentication by ssh key (implemented)
+ clone   : Initialize project (implemented)
+ update  : Pull all repositories (not yet implemented)
+ build   : Build all submodules  (not yet implemented)
+ test    : Run unit and integration tests (not yet implemented)
+ deploy  : Deploy directly to development server (not yet implemented)
+ backup  : Create backup for source code and database (not yet implemented)
+ server  : Multiple server management (not yet implemented)
+ setup   : Setup development environment (not yet implemented)
+ clean   : Cleanup project (not yet implemented)
+ help    : Help command (implemented)
+ version : Current version of Penlook (implemented)

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

+ Test authentication with github server
```bash
$ penlook auth test
```

+ Clone project
```bash
$ penlook clone
```

+ Clone custom submodule
```bash
$ penlook clone deploy
$ penlook clone setup
```

+ List all instance in network
```bash
$ penlook server list
```

+ Setup fresh installation in centos
```bash
$ penlook setup centos
```

+ Setup fresh installation in unbuntu
```bash
$ penlook setup ubuntu
```

+ Help command
```bash
$ penlook help
```

+ Penlook Cli version
```bash
$ penlook version
```
