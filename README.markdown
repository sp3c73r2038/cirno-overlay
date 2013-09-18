## Cirno Overlay

This gentoo overlay is not listed in official overlay list.

## How to use

Get overlay files

```
cd /path/to/local/overlay
git clone git://github.com/aleiphoenix/cirno-overlay
```

Edit `/etc/portage/make.conf`, edit `PORTDIR_OVERLAY` .

```
PORTDIR_OVERLAY="/path/to/local/overlay/cirno-overlay $PORTDIR_OVERLAY"
```

Then run `eix-update` .


## License

All package under this overlay is distributed under its own License.

The ebuild themselves are released under [GPL v2](http://www.gnu.org/licenses/gpl-2.0.html).
