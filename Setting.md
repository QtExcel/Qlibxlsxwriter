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
- Install zlib using NuGet. You may build it yourself using zlib source code, but it will be a very cumbersome task.
- Go to Visual Studio 2017 Menu. 'Tools' > 'NuGet Package Manager' > 'Package Manager Console'
- Type installation command. 
```powershell
Install-Package zlib-msvc-x64 -Version 1.2.11.8900
```
- See [https://www.nuget.org/packages/zlib-msvc-x64/](https://www.nuget.org/packages/zlib-msvc-x64/) for more information.
