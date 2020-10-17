#!/bin/bash
cd $(dirname $0)

# Install mcexplore
git clone https://github.com/Badel2/mcexplore

# https://stackoverflow.com/a/53798785
# True iff all arguments are executable in $PATH
function is_bin_in_path {
  if [[ -n $ZSH_VERSION ]]; then
    builtin whence -p "$1" &> /dev/null
  else  # bash:
    builtin type -P "$1" &> /dev/null
  fi
  [[ $? -ne 0 ]] && return 1
  if [[ $# -gt 1 ]]; then
    shift  # We've just checked the first one
    is_bin_in_path "$@"
  fi
}

# Install slime_seed_finder
is_bin_in_path slime_seed_finder || cargo install slime_seed_finder --features=main --git https://github.com/Badel2/slime_seed_finder
# Install minecraft_downloader
is_bin_in_path slime_seed_finder minecraft_downloader || cargo install minecraft_downloader --git https://github.com/marblenix/minecraft_downloader

# Download official minecraft server
#https://www.minecraft.net/en-us/download/server/
mkdir -p jar
for VER in 1.6.4 1.7.10 1.8.9 1.9.4 1.10.2 1.11.2 1.12.2 1.13.2 1.14.4 1.15.2 1.16.3
do
	# Skip already downloaded versions
	if [ -f jar/minecraft_server.$VER.jar ]; then
		echo "Minecraft $VER already downloaded"
		continue
	fi
	minecraft_downloader --version=$VER --output=jar/minecraft_server.$VER.jar
done
