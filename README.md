# wasi-sdk-setup

> Setup wasi-sdk for local development

The [WASI SDK](https://github.com/WebAssembly/wasi-sdk) is a WASI-enabled WebAssembly C/C++ toolchain that allows you to compile C and C++ code to WebAssembly, which can generate standalone WASI-compliant `.wasm` files. These can then be run in standard WASI environments or custom WASI-like hosts.

This [wasi-sdk-setup](https://github.com/isurfer21/wasi-sdk-setup) project provides a single command `wasi` that wraps the `wasi-sdk` commands and prevents any conflicts with other similar commands.

## Prerequisite
Before using this project, you need to install the [wasi-sdk](https://github.com/WebAssembly/wasi-sdk), which is the **WASI SDK**. Please follow the instructions [here](https://github.com/WebAssembly/wasi-sdk#install) to install it. Alternatively, you can manually download the latest version from [Releases](https://github.com/WebAssembly/wasi-sdk/releases) section.

## Setup
To use this project, you need to do the following steps:

1. Copy the path of the wasi-sdk directory that you installed in the previous step. You can do this by opening a terminal or command prompt and typing:

   ```
   cd wasi-sdk
   pwd
   ```

   This will print the full path of the `wasi-sdk` directory. Copy this path to your clipboard.

2. Add the copied path to the system environment variable with the name `wasi-SDK`. Depending on your operating system, you can do this in different ways:

   - On Windows, you can open the Control Panel, go to System and Security, then System, then Advanced System Settings, then Environment Variables. Click on New under System Variables, enter `wasi-SDK` as the variable name and paste the path as the variable value. Click OK to save the changes.

   - On Linux or macOS, you can open a terminal and type:

      ```
      export wasi-SDK=/path/to/wasi-sdk
      ```

      Replace `/path/to/wasi-sdk` with the path that you copied in the previous step. You can also add this line to your `.bashrc` or `.profile` file to make it permanent.

3. Copy the files `ems.cmd` and `ems.ps1` from this project to a directory that is in your system environment variable `PATH` on Windows whereas copy `wasi.sh` file on Linux/macOS to export in global environment variable. You can do this in any of these ways:

   - Add the `wasi-sdk-setup` directory path to your `PATH`. To do this, you can follow the same steps as in step 2, but use `PATH` as the variable name and append the directory path to the existing value, separated by a semicolon on Windows or a colon on Linux/macOS.

   - Copy these files to a directory that is already in your `PATH`. You can find out which directories are in your `PATH` by typing:

      ```
      echo $PATH
      ```

      This will print a list of directories separated by semicolons on Windows or colons on Linux/macOS. Choose one of these directories and copy the files there.

   - Copy these files to the `system32` folder on Windows or the `/bin` directory on Linux/macOS. These directories are usually in your `PATH` by default, so you don't need to modify anything. However, you may need administrative privileges to copy files there.

      - The full path of the `system32` dir on Windows is `C:\Windows\System32`. This directory contains many system files and executables that are essential for Windows to function properly. It is also included in the `PATH` environment variable, which means that you can run any executable in this directory from any location in the command prompt.

      - The full path of the `bin` directory on Linux and macOS is `/bin`. This directory contains many common commands and utilities that are used by the operating system and users. It is also included in the `PATH` environment variable, which means that you can run any executable in this directory from any location in the terminal.

###  On macOS / Linux

You need to convert a `wasi.sh` file to executable on Mac or Linux. 

So, remove the extension from `wasi.sh` and change the **permissions** of the file to make it executable by using the `chmod` command. 

For example, if you want to make the file executable only by yourself, you can write:

```bash
mv wasi.sh wasi
chmod u+x wasi
```

If you want to make the file executable by anyone on the system, you can write:

```bash
mv wasi.sh wasi
chmod a+x wasi
```

After doing these steps, you can run the script by typing:

```bash
./wasi <command> <arguments>
```

or by double-clicking it on Mac.

## Usage
To use wasi-sdk, you normally need to use commands like `clang` or `clang++`, for example:

```
clang hello.c -o hello.wasm
wasmtime hello.wasm
``` 

or 

```
clang++ hello.cpp -o hello.wasm
wasmtime hello.wasm
```

These commands compile your C or C++ code to WebAssembly and generate an HTML file that can run it in a browser.

With this project, you just need to prefix these commands with `wasi`, for example:

```
wasi clang hello.c -o hello.wasm
wasmtime hello.wasm
``` 

or 

```
wasi clang++ hello.cpp -o hello.wasm
wasmtime hello.wasm
```

This way, you can use all the `wasi-sdk` commands with the `wasi` prefix. This ensures that you are using the correct version of wasi-sdk and avoids any conflicts with other commands.
