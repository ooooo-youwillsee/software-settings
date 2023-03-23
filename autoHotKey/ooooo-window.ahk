#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
;#HotkeyInterval 100

; # win , ! Alt , ^ Ctrl, + Shift



; for hhkb
$#h::Send {Left}
$#l::Send {Right}
$#j::Send {Down}
$#k::Send {Up}
#i::Send {End}
^#i::Send +{End}
#u::Send {Home}
^#u::Send +{Home}

/*
 * ; everything
 * ^Space::Send #^{F12}
 */
; 关闭当前窗口
$^w::
WinGet, name, ProcessName, A
WinGet, path, ProcessPath, A
if (name == "WeChat.exe") {
    Send !{F4}
}else if (name == "chrome.exe") {
    Send ^w
}else If InStr(path, "JetBrains\Toolbox\apps") {
    ; JetBrains apps close window
    Send ^{F4}
 }else {
    Send ^w
}
; 退出程序
return
^q::
WinGet, name, ProcessName, A
Run taskkill /im %name% /f
return

;MsgBox, %path%, %ProcessPath%

; 显示桌面
#d::
if (toggle:=!toggle)
    WinMinimizeAll
else
    WinMinimizeAllUndo
return


; lanuch search
;^Space::
;Send #s
;return

; JetBrains apps open settings
^,::
WinGet, path, ProcessPath, A
WinGet, name, ProcessName, A
If InStr(path, "JetBrains\Toolbox\apps")
    Send ^!s
return
; JetBrains apps rename
#3::
WinGet, path, ProcessPath, A
If InStr(path, "JetBrains\Toolbox\apps")
    Send +{F6}
return
; JetBrains apps generate
#n::
WinGet, path, ProcessPath, A
If InStr(path, "JetBrains\Toolbox\apps")
    Sleep 300
    Send !{Insert}
return

; JetBrains apps code completion
#/::
WinGet, path, ProcessPath, A
If InStr(path, "JetBrains\Toolbox\apps")
    Send !/
return

; ticktick 打开
$^\::Send ^+!o

;~ #IfWinActive ahk_exe - Notepad

;~ MsgBox xxx
;~ DetectHiddenWindows On
;~ #If WinActive("ahk_exe" WeChat.exe)
    ;~ MsgBox xxx
;~ #if
