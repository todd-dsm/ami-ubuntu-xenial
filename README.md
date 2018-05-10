# ami-ubuntu
Base Ubuntu AMI

This will grab the latest EC2-ready Ubuntu Xenial AMI off the shelf, run automated configurations on it, and pack it up as a private, reusable AMI.ubuntu-xenial.json

It also demonstrates a few concepts:

1. no credentials need to be set in packer; set them [properly], [elsewhere]. 
2. variables can be set and reused
3. environment variables can be called from subsequent scripts
4. there is a method to search for the latest AMI of a specification
5. volumes of a type can be added/modified

This is a good place to start. And remember...

This is a test. This is _only_ a test.

## Setup
You may want to consider picking up some packer-specific settings for your `~/.bashrc`:
```bash
###############################################################################
###                                  Packer                                 ###
###############################################################################
export PACKER_LOG='yes'
export PACKER_LOG_PATH='/tmp/packer.log'
export PACKER_NO_COLOR='yes'
```
Source that in and you are good to go. Checking the packer log while debugging reveals quite a lot.


## Usage
Pull the code

`git clone git@github.com:todd-dsm/ami-ubuntu-xenial.git`

Modify ubuntu-xenial.json and test it:

`packer validate ubuntu-xenial.json`

`packer inspect ubuntu-xenial.json`

If that all goes well, run the build:

`packer build -color=false ubuntu-xenial.json 2>&1 | tee /tmp/packer-build.out`




[elsewhere]:https://github.com/todd-dsm/mac-ops/wiki/Install-awscli
[properly]:https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html