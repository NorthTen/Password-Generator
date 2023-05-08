#!/usr/bin/bash
mkdir -p out # Make directory out if it does not exist, if it does, continue.
nimble build --opt:size --app:console --panics:on --mm:orc --backend:c --embedsrc:off --noNimblePath --panics:on -d:release --os:$1  # We pass a option to os. Default: "linux"
mv -f ./passwordgen ./out # the app is compiled within ./ and so we must move it to ./out for organization.
