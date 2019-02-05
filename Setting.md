# Setting for Qlibxlsxwriter

## Settings for Linux
- Install programs
	* gcc and essential build tool
	* zlib for development
	* Qt 5 	

## Settings for MingW with Qt5
- No more setup is required.

## Settings for MSYS2 with Qt5
- Install the dev tools for libxlsxwriter.
```bash
pacman -S mingw-w64-x86_64-toolchain git gcc make zlib-devel
```
- See [https://github.com/j2doll/Qlibxlsxwriter/issues/1](https://github.com/j2doll/Qlibxlsxwriter/issues/1).

## Settings for Visual Studio 2017 with Qt5

1. 'Qt VS Tools' / 'Open Qt Project File (*.pro)' 

2. Save *.sln and *.vcxproj

3. 'Tools' / 'NuGet Package Manager' / 'Package Manager Console'
 
4. Type 'Install-Package zlib-msvc-x64 -Version 1.2.11.8900' in 'Package Manager Console'. (INSTALL ZLIB-DEV)

   - See https://www.nuget.org/packages/zlib-msvc-x64/ for more information.

   - :boom: If follwing Error Message is found, you must install zlib-dev for Visual Studio.
       - 'Cannot open include file: 'zlib.h': No such file or directory'

5. Build project 

