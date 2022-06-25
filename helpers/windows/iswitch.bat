@echo off

rem Copyright Rogue Porter 2022

pushd C:\Windows\System32\drivers\etc
iswitch.exe %1
popd
