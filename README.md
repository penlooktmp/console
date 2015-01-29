# Penlook Console

Build status

[![Build Status](https://travis-ci.org/penlook/service.svg?branch=master)](https://travis-ci.org/penlook/service) [![Software License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.md) [![Author](http://img.shields.io/badge/author-penlook-red.svg?style=flat)](https://github.com/penlook)

### Installation
```bash
curl https://raw.githubusercontent.com/penlook/console/master/install.sh | python
```

### Command-line

```bash
penlook clone update build test deploy backup
```

+ clone   : Initialize project
+ update  : Pull all repositories
+ build   : Build all submodules
+ test    : Run unit and integration tests
+ deploy  : Deploy directly to development server
+ backup  : Create backup for source code and database
+ clean   : Cleanup project
+ version : Current version of Penlook

