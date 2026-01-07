#Requires AutoHotkey v1.1.12+
;==============================================================
; loadCursor — Loads a shared system cursor handle via LoadImage
;
; GitHub: https://github.com/SevenKeyboard/load-cursor
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;
; Documentation / References:
;   How to set different cursors for each control in v2 (WM_SETCURSOR)
;     https://www.autohotkey.com/boards/viewtopic.php?t=124612
;   How to set the mouse cursor icon?
;     https://www.autohotkey.com/boards/viewtopic.php?t=101609
;   How to properly change the mouse cursor on control hovering
;     https://www.autohotkey.com/board/topic/53704-how-to-properly-change-the-mouse-cursor-on-control-hovering/
;==============================================================

/*
Example Usage:
    IDC_HAND:=32649
    hcursorHand:=loadCursor(,IDC_HAND)
*/

loadCursor(hInst:=0, name:="")    {
    static IMAGE_CURSOR:=2
        ,LR_DEFAULTSIZE:=0x00000040
        ,LR_SHARED:=0x00008000
    ;  return dllCall("User32.dll\LoadCursor", "Ptr",hInst, "Ptr",name, "Ptr")
    return (name==""?false:dllCall("User32.dll\LoadImage", "Ptr",hInst, "Ptr",name, "UInt",IMAGE_CURSOR, "Int",0, "Int",0, "UInt",LR_DEFAULTSIZE|LR_SHARED, "Ptr"))
}