## Cirno Overlay

This gentoo overlay is not listed in official overlay list.

## How to use

1. install layman.

2. add a file `${EPREFIX}/etc/layman/overlays/cirno.xml` with content:

```
<?xml version="1.0" ?>
<repositories version="1.0">
        <repo priority="50" quality="experimental" status="unofficial">
                <name>cirno</name>
                <description>missing daily reppo</description>
                <homepage>http://github.com/aleiphoenix/cirno-overlay</homepage>
                <owner>
                        <email>aleiphoenix@gmail.com</email>
                </owner>
                <source type="git">git://github.com/aleiphoenix/cirno-overlay.git</source>
        </repo>
</repositories>
```

3. run `layman -a cirno`.

3. run `eix-update`.


## License

All package under this overlay is distributed under its own License.

The ebuild themselves are released under [GPL v2](http://www.gnu.org/licenses/gpl-2.0.html).
