# ssf-testing
A script used to test slime_seed_finder against the official minecraft server

# Install
Clone the repo, and run `./setup.sh`.

This will also install the dependencies:
 
<https://github.com/Badel2/mcexplore>
<https://github.com/marblenix/minecraft_downloader>
<https://github.com/Badel2/slime_seed_finder>

# Running
To generate a random world and compare its biomes to the ones genereted by slime_seed_finder, run:

```
./biomes/generate_world.sh
```

To leave the script running until some world fails the verification, use:

```
./untilfail.sh ./biomes/generate_world.sh
```

You can change the minecraft version used by editing the `VER` variable in
`./biomes/generate_world.sh`. Also, you can reduce `CHUNK_XSIZE` if the generation is too slow.

Warning: the strategy used to generate worlds using the official minecraft server is very slow.
But the worlds are saved for later, so any updates to slime_seed_finder can be quickly verified as
non-breaking.
