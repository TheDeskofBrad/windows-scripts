﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Shortcut to force reload of script
^!r::
	Send, ^s ; To save a changed script
	Sleep, 300 ; give it time to save the script
	Reload
Return

; Ctrl-Q close active window
^q::
PostMessage, 0x112, 0xF060,,, A
return

; Ctrl-Alt-K to open Windows shutdown dialog
^!k::
Run C:\Applications\Scripts\shutdown.js
return

; Ctrl-Alt-C to centre active window
^!c::
	WinGetTitle, ActiveWindowTitle, A
	WinGetPos,,, Width, Height, %ActiveWindowTitle%
	{
		TargetX := (A_ScreenWidth/2)-(Width/2)
		TargetY := (A_ScreenHeight/2)-(Height/2)-48
	}
	WinMove, %ActiveWindowTitle%,, %TargetX%, %TargetY% ; The actual action, moving the active window to our calculated coordinates.
return

; Ctrl-Alt-1 to resize active window to 90% of screen
^!1::
	WinGetTitle, ActiveWindowTitle, A
	{
		TargetWidth := (A_ScreenWidth*0.9)
		TargetX := (A_ScreenWidth/2)-(TargetWidth/2)
		TargetHeight := (A_ScreenHeight*0.85)
		TargetY := (A_ScreenHeight/2)-(TargetHeight/2)-48
	}
	WinMove, %ActiveWindowTitle%,, %TargetX%, %TargetY%, %TargetWidth%, %TargetHeight%
return

; Alternate windows media controls
^!Left::Send   {Media_Prev}
^!Space::Send  {Media_Play_Pause}
^!Right::Send  {Media_Next}
^!Up::Send     {Volume_Up}
^!Down::Send   {Volume_Down}

:::tsm::
	Send ツ
return

:::tsh::
	Send ¯\_(ツ)_/¯
return