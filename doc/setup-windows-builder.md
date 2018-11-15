Setup project builder on Windows 10
===================================

Install building tools
----------------------

* Omnibus Toolchain (1.1.93)

```
https://packages.chef.io/files/stable/omnibus-toolchain/1.1.93/windows/2012r2/omnibus-toolchain-1.1.93-1-x64.msi
```

* Git (to clone the repo and for Omnibus caching):

```
https://git-scm.com/download/win
```

* 7Zip (to unpack ZIP source archives):

```
http://www.7-zip.org/download.html
```

* Wix (3.11.1):

```
https://github.com/wixtoolset/wix3/releases/tag/wix3111rtm
```

* Windows SDK

```
https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk
```

* Visual Studio Community Edition 2017
Install the "Desktop Development with C++" and Windows 8.1 SDK components.

```
https://visualstudio.microsoft.com/downloads/
```

Preparation Steps
-----------------

1. tmp file
Create tmp in `C:\opscode\omnibus-toolchain\embedded\bin` (yes, *in* `bin`). If
you don't do that the Omnibus build will emit warnings and eventually fail with
an obscure "too many arguments" error.

Thanks to [aptible](https://github.com/aptible/omnibus-aptible-toolbelt/blob/master/doc/WINDOWS.md) for this tip.

2. Set up environment in *windows power shell* with *administrator* rights

```
$env:path = "C:\opscode\omnibus-toolchain\embedded\bin;$env:path"
$env:path = "C:\opscode\omnibus-toolchain\embedded\bin\usr\bin;$env:path"
$env:path = "C:\opscode\omnibus-toolchain\embedded\bin\usr\bin;$env:path"
$env:path = "C:\opscode\omnibus-toolchain\embedded\bin\mingw64\bin;$env:path"
$env:path = "C:\Program Files\7-Zip;$env:path"
$env:path = "C:\Program Files (x86)\WiX Toolset v3.11\bin;$env:path"
$env:path = "C:\Program Files (x86)\Windows Kits\8.1\bin\x64;$env:path"
$env:MSYSTEM = "mingw64"
$env:OMNIBUS_TOOLCHAIN_INSTALL_DIR = "C:\opscode\omnibus-toolchain"
$env:OMNIBUS_WINDOWS_ARCH = "x64"
```

Build
-----

1. Download project using git

```
git clone --depth=1 https://github.com/3scale/3scale_toolbox_packaging.git
```

2. Install dependencies

```
bundle install --path vendor/bundle
```

2. Build project
```
bundle exec omnibus build 3scale-toolbox
```
