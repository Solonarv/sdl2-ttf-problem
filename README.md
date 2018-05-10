# sdl2-ttf-problem

Minimal reproduction of an issue with `sdl2-ttf` encountered while making [perfect-flow](https://github.com/Solonarv/perfect-flow).

To reproduce, execute the following steps:

```bash
    # Make sure stack's pacman is up to date
    stack exec -- pacman -Syu
    # Install pkg-config, SDL2 and SDL2_ttf somewhere stack can find them
    stack exec -- pacman -S mingw-w64-x86_64-pkg-config mingw-w64-x86_64-SDL2 mingw-w64-x86_64-SDL2_ttf
    git clone https://github.com/Solonarv/sdl2-ttf-problem
    cd sdl2-ttf-problem
    stack build
    stack exec -- sdl2-ttf-problem
```

Reading the source of [Main](src/Main.hs) suggests that a prompt will appear, asking `Should we attempt to initialize sdl2-ttf?`.
Instead, nothing happens and the program exits immediately. This is surprising, especially because it happens
*even if no sdl2-ttf functions are called*.

I originally encounterd this bug while working on [perfect-flow](https://github.com/Solonarv/perfect-flow), reproduced it
using the examples from the [sdl2-ttf](https://github.com/haskell-game/sdl2-ttf) repo, and also with this minimal program.

Versions used are:

    OS: Windows 7 Professional
    stack: originally 1.6.5, reproduced identically on 1.7.1
    mingw-w64-x86_64-SDL2 2.0.8-1
    mingw-w64-x86_64-SDL2_ttf 2.0.14-1
    sdl2: 2.4.0.1
    sdl2-ttf: 2.0.2
    Using LTS-11.7 snapshot

Edit: this appears to be related to an incorrect version of `zlib1.dll`.