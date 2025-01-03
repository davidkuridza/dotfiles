# .dotfiles

HereBe my dotfiles.

## Installation

### Word of advice

If you are not me, you may want to reconsider installing this repository directly.
Many settings are specific to my environment, at least review them before applying them anywhere.

### Actual installation (if you are me)

Simply clone the repository to your favourite location, for example:

```shell
git clone https://github.com/davidkuridza/dotfiles.git ~/.dotfiles
~/.dotfiles/bootstrap.sh
```

## How does it work?

### Tree structure

```
.
├── bin
│   └── ... <-- executable scripts
├── custom
│   ├── bin
│   ├── dots
│   └── provision.sh
├── dots
│   └── ... <-- actual dotfiles
├── Brewfile
├── bootstrap.sh
└── macos.sh
```

### bin

`bin` directory is in the `$PATH`, making its executable scripts available everywhere.

### custom

All the sensitive data can be added to `custom` directory.
For example, you can use a private VCS cloned to `custom` containing dotfiles with secrets (e.g. tokens, password etc) and other things which should not be exposed to the public.

```
custom
├── bin
│   └── ... <-- executable scripts
├── dots
│   ├── .alias.local
│   ├── .exports.local
│   └── ... <-- actual dotfiles
├── Brewfile
└── provision.sh
```

Tailored provisioning can be done in `provision.sh`, the rest of the files and directories are used automatically.

### dots

All the files and directories starting with a `.` are symlinked to `$HOME`.

### Brewfile

`Brewfile` is a list of packages to be installed with `brew bundle install`.

## Inspiration

* <https://github.com/mathiasbynens/dotfiles>
* whole bunch of other places I don't remember
* and +20 years of experience and simplification :)

## License

Licensed under the [MIT license](LICENSE).

## Fonts

* [Hack](https://sourcefoundry.org/hack/)
