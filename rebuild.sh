#!/bin/bash
set -x
# This is a total hack until we can get time/permission to rebuild the pages
# within a single site.

COLOR_END='\e[0m'
COLOR_RED='\e[0;31m'

ROOT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SITES_DIR="${ROOT_DIR}/sites"

SITES="sites/colloquia/2017 sites/colloquia/2018 sites/colloquia/2019"

msg_exit() {
    printf "$COLOR_RED$@$COLOR_END"
    printf "\n"
    printf "Exiting...\n"
    exit 1
}

cleanup() {
    msg_exit "Site Update failed"
}
trap "cleanup" ERR INT TERM

cd "${ROOT_DIR}"
for site in ${SITES} ; do
    source="${ROOT_DIR}/${site}"
    if [ -d "${source}" ]; then

        target="${ROOT_DIR}/static/$( basename "${site}" )"
        
        if [ -d "${target}" ] ; then
            rm -rf "${target}"
        fi
        cd "${source}"
        hugo --themesDir=${ROOT_DIR}/themes -d ${target}
    else
        echo "Unable to find source site ${source}"
    fi
done

cd ${ROOT_DIR} 
hugo
