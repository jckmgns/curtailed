# Curtailed

A warm color scheme for Vim with a limited palette to avoid visual clutter.

Curtailed is inspired by [Gruvbox](https://github.com/morhetz/gruvbox),
[Solarized](https://ethanschoonover.com/solarized/), and [Jonathan
Blow](https://www.youtube.com/user/jblow888)'s personal syntax theme. It comes
in a dark and light variant and features additional colors for use outside of
programming.

## Installation

Install with your favorite package manager and add the following to your vimrc:

```
syntax enable           " enable syntax highlighting
set termguicolors       " enable true color support
set background=dark     " set to dark mode; use 'light' for light mode
colorscheme curtailed   " set the colorscheme to curtailed
```

--- 

Note that you may have to add the following snippet to your vimrc if no colors
are displayed, even if your terminal emulator supports 24-bit color:

```
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
```

[Neovim](https://neovim.io/) does seem to handle colors in most situations
correctly without further configuration.

## Screenshots

### Dark mode

![Screenshot of dark mode](https://i.imgur.com/0oySuqt.png)

### Light mode

![Screenshot of light mode](https://i.imgur.com/HHx9krf.png)

## Palette

Blue and cyan are not used in the syntax theme itself. Both colors are defined
to be used in other contexts; as part of a terminal prompt for example.

### Dark mode

![Palette for dark mode](https://i.imgur.com/ExpX3FO.png)

### Light mode

![Palette for light mode](https://i.imgur.com/NG8LI8u.png)

## License

[BSD-2-Clause-Patent (BSD+Patent)](https://opensource.org/licenses/BSDplusPatent)
