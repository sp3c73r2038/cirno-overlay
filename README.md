## Cirno Overlay

This gentoo overlay is not listed in official overlay list.

## How to use

1. git clone this repo

2. add repo config

```conf
;; /etc/portage/repos.conf
[cirno]
location = /path/to/this/repo
priority = 100
```

adjust priority when needed

more info on [wiki](https://wiki.gentoo.org/wiki/Ebuild_repository)

3. run `eix-update`.

## License

All package under this overlay is distributed under its own License.

The ebuild themselves are released under [GPL v2](http://www.gnu.org/licenses/gpl-2.0.html).
