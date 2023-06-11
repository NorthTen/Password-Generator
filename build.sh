#!/usr/bin/bash
mkdir -p out # Make directory out if it does not exist, if it does, continue.
args="--opt:size --app:console --panics:on --mm:orc --backend:c --embedsrc:off --noNimblePath --panics:on -d:release --outdir:/out"
if [$1 -eq ""]
then
    echo "no argument provided, defaulting to nimble build."
    platform="linux"
else
    platform=$1
fi

if [ $platform == "all" ]
then
    echo "compiling for every platform."
    ./build.sh "linux" && ./build.sh "windows"
fi

if [ $platform == "linux" ]
then
    nimble build $args --os:linux
    mv -f ./passwordgen ./out
elif [ $platform == "windows" ]
then
    nimble build $args -d:mingw
    mv -f ./passwordgen.exe ./out
# TODO: create build options for MacOS, and Android. Nim is cross-platform, it's just building the binaries all on linux is the problem.
fi
