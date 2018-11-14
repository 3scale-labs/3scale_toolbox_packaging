# 3scale-toolbox Packaging project
This project uses [Chef's Omnibus toolchain](https://github.com/chef/omnibus) to
create full-stack platform-specific
[3scale-toolbox](https://github.com/3scale/3scale_toolbox) packages.

**Support for running 3scale-toolbox on the following platforms
will be provided on a best-effort basis.**

## RELEASES
Download packages from [latest release](https://github.com/3scale/3scale_toolbox_packaging/releases/latest) section.

## PLATFORMS

* [CentOS/Fedora](#centos-fedora)
* [Ubuntu/Debian](#ubuntu-debian)
* [Mac OS X](#mac-os-x)
* [Windows](#windows)

### Centos Fedora

1. Install the `RPM` package using the `rpm` installer utility.

```bash
rpm -Uvh `URL_RPM_PACKAGE`
```

Files will be installed in `/opt/3scale-toolbox`

2. Test executing `help` command.

```bash
3scale help
```

### Ubuntu Debian

1. Download `DEB` package.

```bash
wget `URL_DEB_PACKAGE`
```

2. Install the package using the `dpkg` installer utility.

```bash
dpkg -i 3scale-toolbox_VERSION.deb
```

Files will be installed in `/opt/3scale-toolbox`

3. Test executing `help` command.

```bash
3scale help
```

### Mac OS X

1. Download `pkg` package.

```bash
wget `URL_PKG_PACKAGE`
```

2. Install the package using the `installer` installer utility.

```bash
installer -pkg 3scaletoolbox-VERSION.pkg -target /
```

Files will be installed in `/opt/3scale-toolbox`

3. Create symbolic link on `PATH`.

```bash
ln -s /opt/3scale-toolbox/bin/3scale /usr/local/bin/3scale
```

4. Test executing `help` command

```bash
3scale help
```

### Windows
Requires 64 bit Windows 8.1 or greater or 64 bit Windows Server 2012r2 or greater.

1. Download `MSI` package.

Once installed, you'll have access to the `3scale` command from your command shell

### Troubleshooting

* There are known issues running `3scale toolbox` when `RVM` is installed and active.
You can take the following actions to resolve them:
  * Disable RVM for the current session, then run the toolbox
    ```bash
    rvm use system
    3scale help
    ```
  * Disable RVM just for running one command
    ```bash
    env -u GEM_PATH 3scale help
    ```
