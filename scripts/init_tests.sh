#!/usr/bin/env bash
# shellcheck disable=SC1091
#  PURPOSE: Verify instance details up front.
# -----------------------------------------------------------------------------
#  PREREQS: a) none
#           b)
#           c)
# -----------------------------------------------------------------------------
#  EXECUTE:
# -----------------------------------------------------------------------------
#     TODO: 1)
#           2)
#           3)
# -----------------------------------------------------------------------------
#   AUTHOR: Todd E Thomas
# -----------------------------------------------------------------------------
#  CREATED: 2018/04/08
# -----------------------------------------------------------------------------
#set -x


###----------------------------------------------------------------------------
### VARIABLES
###----------------------------------------------------------------------------
# Normalize ENV Stuff
export DEBIAN_FRONTEND=noninteractive
#: "${VAULT_ADDR:+https://localhost:8200}"
#: "${VAULT_SKIP_VERIFY:+true}"
#: "${dependsEtcd?Dependency etcd is not ready yet}"

#declare myVar='yo'


###----------------------------------------------------------------------------
### FUNCTIONS
###----------------------------------------------------------------------------
function pMsg() {
    theMessage="$1"
    printf '%s\n' "$theMessage"
}


###----------------------------------------------------------------------------
### MAIN PROGRAM
###----------------------------------------------------------------------------
### Verify the OS and HW
###---
gpuMFGR="$(lspci | grep -i nvidia | cut -d' ' -f4)"
if [[ "$gpuMFGR" != 'NVIDIA' ]]; then
    pMsg "The GPU is missing; there's no point to it all. Exiting"
    exit 1
else
    pMsg "We have GUPs!"
fi

###---
### Verify the architecture
###---
osArch="$(uname -m)"
if [[ "$osArch"  != 'x86_64' ]]; then
    pMsg "The Arch is not 64-bit; there's no point to it all. Exiting"
    exit 1
else
    pMsg "This is a 64-bit system."
fi

###---
### Verify the OS
###---
source /etc/os-release

if [[ "$ID" != 'debian' ]]; then
    pMsg "This is not Debian. Why - WHY?!?!?!. Exiting"
    exit 1
else
    pMsg "This is a Debian system."
fi


###---
### REQ
###---


###---
### Clean-up
###---



###---
### fin~
###---
exit 0
