#!/bin/bash
#################################################################################
# author : psglinux@gmail.com
# script : a bash script to generate the artifacts for linux binary analysis project
#################################################################################

#binaries
NM=nm
OBJDUMP=objdump
RM='rm -i'
MKDIR='mkdir -p'

#paths
SRC_PATH=~/working/MS/team-elfs-cmp279/analysis-code
GEN_PATH=~/working/MS/team-elfs-cmp279/analysis-code/output
NMOP=nm-output
OBJDUMPOP=objdump-output
READELFOP=readelf-output

# create an array of commands
# elements of array are fixed position
# ("command", "options", "outputfilename")
NMARR=("nm" "-e" $NMOP)
OBJDUMPARR=("objdump" "-a" $OBJDUMPOP)
READELFL=("readelf" "-l" $READELFOP)
READELFA=("readelf" "-a" $READELFOP)
READELFH=("readelf" "-h" $READELFOP)
READELFS=("readelf" "-s" $READELFOP)
READELFG=("readelf" "-g" $READELFOP)
READELET=("readelf" "-t" $READELFOP)
READELFE=("readelf" "-e" $READELFOP)
READELFS=("readelf" "-s" $READELFOP)
READELFDYN=("readelf" "--dyn-syms" $READELFOP)
READELFN=("readelf" "-n" $READELFOP)
READELFR=("readelf" "-r" $READELFOP)
READELFU=("readelf" "-u" $READELFOP)
READELFD=("readelf" "-d" $READELFOP)
READELFARCH=("readelf" "-A" $READELFOP)
READELFDBG=("readelf" "--debug-dump" $READELFOP)

BINUTILARR=(
    NMARR[@]
    OBJDUMPARR[@]
    READELFL[@]
    READELFA[@]
    READELFH[@]
    READELFS[@]
    READELFG[@]
    READELET[@]
    READELFE[@]
    READELFS[@]
    READELFDYN[@]
    READELFN[@]
    READELFR[@]
    READELFU[@]
    READELFD[@]
    READELFARCH[@]
    READELFDBG[@]
)

function clean_artifacts()
{
    echo "----- Cleaning Artifacts"
    if [ -d $GEN_PATH ]; then
        $RM -rf $GEN_PATH
    fi
}

function check_output_file()
{
    OPFILE=$1
    if [ -e $OPFILE ]; then
        echo "#### Generated "$OPFILE
    else
        echo "!! failed to Generate "$OPFILE
    fi
}

# func
function generate_generic_dump()
{
    #echo "function:" $@
    exe=$1
    cmd=$2
    opt=$3
    opfile=$4

    FL=$GEN_PATH/$exe-$cmd$opt-$opfile
    echo "####"
    echo "#### executing #"$cmd $opt $output
    echo "= Generating output from "$cmd $opt" for " $exe"=" > $FL
    $cmd $opt $exe >> $FL
    check_output_file $FL
}

function generate_artifacts()
{
    exe=$1
    echo "Generating artifacts ---"
    echo "executable:" $exe
    if [ ! -d $GEN_PATH ]; then
        $MKDIR $GEN_PATH
    fi

    count=${#BINUTILARR[@]}
    for ((i=0; i<$count; i++))
    do
        cmd=${!BINUTILARR[i]:0:1}
        opt=${!BINUTILARR[i]:1:1}
        output=${!BINUTILARR[i]:2:1}
        #echo ${!BINUTILARR[i]}
        generate_generic_dump $exe ${!BINUTILARR[i]}
    done

}

# Usage info
usage() {
cat << EOF
Usage: ${0##*/} [-c] [-g]
This script would generate all the artifacts of the binary analysis

    -c          clean previous outputs
    -e          ELF executable
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

    while getopts "ce:gh" o; do
        case "${o}" in
        c)
            clean_artifacts
            ;;
        e)
            e=${OPTARG}
            echo "e:"$e
            generate_artifacts $e
            exit 0
            ;;
        g)
            echo "TBD"
            ;;
        *)
            usage
            ;;
        esac
    done
    shift 0

}

main $@

