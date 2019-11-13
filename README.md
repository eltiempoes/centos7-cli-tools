# Docker Centos 7 Command line tools

This Docker image is intended to be used as a general command-line tools image. It contains:

* php-cli 7.2.17
* node version 6.9.0
* npm version 3.10.8
* bower
* gulp

## How to use it

If you want an interactive session to run several commands that are stored in `/home/user/scritps`:

```
docker run -it --rm -v /home/user/scripts:/workspace-folder -w /workspace-folder eltiempoes/centos7-cli-tools bash
```

If you want to execute a php script:
```
docker run -it --rm -v /home/user/scripts:/workspace-folder -w /workspace-folder eltiempoes/centos7-cli-tools php /workspace/script.php
```
