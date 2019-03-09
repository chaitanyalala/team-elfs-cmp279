#!/bin/bash
#################################################################################
# author : psglinux@gmail.com
# script : a bash script to generate the artifacts for linux binary analysis project
#################################################################################

SRC_PATH=~/working/MS/team-elfs-cmp279/analysis-code
GEN_PATH=~/working/MS/team-elfs-cmp279/analysis-code/output

RM='rm -i'
MKDIR='mkdir -p'

function clean_artifacts()
{
    echo "Cleaning Artifacts ---"
    if [ -d $GEN_PATH ]; then
        $RM -rf $GEN_PATH
    fi
}

function generate_simple_nm()
{
    echo "Generating Simple nm"
}

function generate_artifacts()
{
    echo "Generating artifacts ---"
    if [ ! -d $GEN_PATH ]; then
        $MKDIR $GEN_PATH
    fi
    generate_simple_nm
}
# Usage info
usage() {
cat << EOF
Usage: ${0##*/} [-c] [-g]
This script would generate all the artifacts of the binary analysis

    -c          clean previous outputs
    -g          generate all the binary analysis artifacts
    -h          help

NOTE: The script depends on a few env variables
      ensure that the varaibales are set before you execute this script
EOF
    exit 1;
}

function main() {

    #check if more then 1 args
    #echo $#
    if [ $# -lt 1 ]; then
        echo 1>&2 "$0: not enough arguments"
        usage
    fi

    while getopts "cgh" o; do
        case "${o}" in
        c)
            clean_artifacts
            ;;
        g)
            generate_artifacts
            ;;
        *)
            usage
            ;;
        esac
    done
    shift 0

}

main $@

