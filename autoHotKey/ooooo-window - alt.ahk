#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force

; # win , ! Alt , ^ Ctrl, + Shift

; for hhkb
$^h::Send {Left}
$^l::Send {Right}
$^j::Send {Down}
$^k::Send {Up}
$^i::Send {End}
$^!i::Send +{End}
$^u::Send {Home}
$^!u::Send +{Home}



; 复制
!c::Send ^c
; 撤销
!z::Send ^z
; 粘贴
!v::Send ^v
; 剪贴
!x::Send ^x
; 保存
!s::Send ^s
; 全选
!a::Send ^a
; 查找
!f::Send ^f
; chrome 定位到地址栏
!l::Send ^l
; 打印
!p::Send ^p
; 复制，删除当前行
!d::Send ^d
; 浏览器打开新的标签页
!t::Send ^t
; 关闭当前窗口
!w::
WinGet, name, ProcessName, A
if (name == "WeChat.exe") {
    Send !{F4}
}else if (name == "chrome.exe") {
    Send ^w
}
; 退出程序
return
!q::
WinGet, name, ProcessName, A
Run taskkill /im %name% /f
return

!::Send ^
return

; snipaste 截图
!+x::Send +{F1}



; JetBrains apps add to cvs
#!a::
WinGet, path, ProcessPath, A
If InStr(path, "JetBrains\Toolbox\apps")
    Send ^!a 
return
; JetBrains apps format code 
#!l::
WinGet, path, ProcessPath, A
If InStr(path, "JetBrains\Toolbox\apps")
    Send ^!l 
return
; JetBrains apps go to declaration
!LButton::
WinGet, path, ProcessPath, A
If InStr(path, "JetBrains\Toolbox\apps")
    Send ^{Click Left}
return
; JetBrains apps go to implementation
!#LButton::
WinGet, path, ProcessPath, A
If InStr(path, "JetBrains\Toolbox\apps")
    Send ^!b
return
; JetBrains apps open settings
!,::
WinGet, path, ProcessPath, A
If InStr(path, "JetBrains\Toolbox\apps")
    Send ^!s
return


; ticktick 打开
!\::Send ^+!o

;~ #IfWinActive ahk_exe - Notepad


;~ MsgBox xxx
;~ DetectHiddenWindows On
;~ #If WinActive("ahk_exe" WeChat.exe)
    ;~ MsgBox xxx
;~ #if
