; Written by Qingda Zou
; 2015-??-??
; Autohotkey window tiling script
; Key-combinations of numpad-0 and numpad-* brings focused window to top left quadrant
; 0-(7,8,/,9) moves window around, 7-left, 8-down, 9-right, /-up
; 0-(1,2,5,3) changes window size, 1-shrink left, 2-shrink up, 3-expand right, 5-expand down
; Margin value changes the width of margin among windows
;    as well as margin between window and screen edge.
; Should work for any number of horizontally-connected monitors.


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;~~~~~~~~~~DECLARE VARIABLES~~~~~~~~~~~~~

Margin=20
SysGet, Mon1, MonitorWorkArea
;MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
quarterwidth := (Mon1Right-3*Margin)/2
quarterheight := (Mon1Bottom-3*Margin)/2

WinGetPos, X, Y, Width, Height, A
;MsgBox, %X%

;~~~~~~~~~DECLARE VARIABLES~~~~~~~~~~~~~

;~~~~~~~~~~WINDOW MOVEMENT~~~~~~~~~~~~~~~

Numpad0 & NumpadMult::
   WinMove, A,, (-Mon1Right + Margin), (Margin), (quarterwidth), (quarterheight)
return

Numpad0 & NumpadDiv::
   WinGetPos, X, Y, Width, Height, A
   WinMove, A,, (X), (Y - quarterheight - Margin), (Width), (Height)
return

Numpad0 & Numpad7::
   WinGetPos, X, Y, Width, Height, A
   if X=20
   {
   WinMove, A,, (X - quarterwidth - 2*Margin), (Y), (Width), (Height)
   }
   else if X!=20
   {
   WinMove, A,, (X - quarterwidth - Margin), (Y), (Width), (Height)
   }
return

Numpad0 & Numpad8::
   WinGetPos, X, Y, Width, Height, A
   WinMove, A,, (X), (Y + quarterheight + Margin), (Width), (Height)
return

Numpad0 & Numpad9::
   WinGetPos, X, Y, Width, Height, A
   if X=-950
   {
   WinMove, A,, (X + quarterwidth + 2*Margin), (Y), (Width), (Height)
   }
   else if X!=-950
   {
   WinMove, A,, (X + quarterwidth + Margin), (Y), (Width), (Height)
   }
return

;~~~~~~~~~/WINDOW MOVEMENT~~~~~~~~~~~~~~~

;~~~~~~~~~~WINDOW SIZING~~~~~~~~~~~~~~~~~

Numpad0 & Numpad5::
   WinGetPos, X, Y, Width, Height, A
   WinMove, A,, (X), (Y), (Width), (2*quarterheight + Margin)
return

Numpad0 & Numpad1::
   WinGetPos, X, Y, Width, Height, A
   WinMove, A,, (X), (Y), (quarterwidth), (Height)
return

Numpad0 & Numpad2::
   WinGetPos, X, Y, Width, Height, A
   WinMove, A,, (X), (Y), (Width), (quarterheight)
return

Numpad0 & Numpad3::
   WinGetPos, X, Y, Width, Height, A
   WinMove, A,, (X), (Y), (2*quarterwidth + Margin), (Height)
return


;~~~~~~~~~/WINDOW SIZING~~~~~~~~~~~~~~~~~