@echo off
setlocal
set wasi_bin_path=%WASI_SDK_PATH%\bin
set wasi_self=%~n0
set wasi_cmd=%1
if "%wasi_cmd%" == "" (
  echo Usage: %wasi_self% executable [arguments]
  exit /b 1
)
if not exist "%wasi_bin_path%\%wasi_cmd%.exe" (
  echo Error: %wasi_cmd% is not a valid executable in %wasi_bin_path%
  exit /b 2
)
shift
%wasi_bin_path%\%*
