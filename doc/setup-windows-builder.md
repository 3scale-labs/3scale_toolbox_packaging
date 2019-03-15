Setup project builder on Windows 10
===================================

Install building tools
----------------------


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

* Ruby framework and Devkit 2.5.3
Make sure MSYS is installed in `C:\msys2`

```
https://github.com/oneclick/rubyinstaller2/releases/download/rubyinstaller-2.5.3-1/rubyinstaller-devkit-2.5.3-1-x64.exe
```

Preparation Steps
-----------------

1. Install bundler
On Powershell
```
gem install bundler
```

2. Set up environment in *windows power shell* with *administrator* rights

Just copy&paste
```
$env:path = "$env:path;C:\msys2\usr\bin"
$env:path = "$env:path;C:\msys2\mingw64\bin"
$env:path = "C:\Program Files\7-Zip;$env:path"
$env:path = "C:\Program Files (x86)\WiX Toolset v3.11\bin;$env:path"
$env:path = "C:\Program Files (x86)\Windows Kits\8.1\bin\x64;$env:path"
$env:MSYSTEM = "mingw64"
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
