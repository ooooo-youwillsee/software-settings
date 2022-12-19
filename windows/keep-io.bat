@echo off
:loop
ping 127.0.0.1 -n 300 >nul
echo keep >D:\disk_keep_connected.canberemoved
goto loop