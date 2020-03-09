#!/bin/bash
BACKUP_FOLDER="${HOME}/oldConfigs"
SUFFIX=".erc"

echo "Backing up your current conf files in ${BACKUP_FOLDER} in case you change your mind"

function safeMove() {
    local answer
    if [ "$1" = "README.md" ]; then
        return
    fi
    if [ "$1" = "install.sh" ]; then
        return
    fi
    local base_file=$(basename -s ${SUFFIX} $1)
    read  -p "Would you like to install .${base_file} (y/n)? " -n 1 answer
    echo
    if [ "${answer}" = "y" ];
    then
        mv ${HOME}/".${base_file}" ${BACKUP_FOLDER}/${base_file}
        cp $1 ${HOME}/".${base_file}"
    else
        echo "Skipping"
        return
    fi
}


if [ ! -d "${BACKUP_FOLDER}" ]; then
    mkdir ${BACKUP_FOLDER}
fi

declare -a ALL_FILES=()

ALL_FILES=$(ls *.erc)

for name in ${ALL_FILES[@]}; do
    safeMove "${name}"
done

exit 0


