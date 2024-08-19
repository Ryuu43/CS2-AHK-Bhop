#Persistent
#NoEnv

DllCall("timeBeginPeriod", UInt, 1)

; Set the process priority to REALTIME_PRIORITY_CLASS
Process, Priority, , R

SetTitleMatchMode, 2  
SetTitleMatchMode, Fast ; Faster matching
TICK_64_MS := 13.5
exit_key := "End"
activation_key := "xButton1"

Gui, Font, cFFFFFF 
Gui, Add, Text, x10 y10 w50 h50, Important :
Gui, Font, cFFFFFF 
Gui, Add, Text, x70 y10 w200 h50, Make sure put this command in console.
Gui, Font, c00FF1D 
Gui, Add, Text, x110 y30 w220 h50, For de-subtick and consistent jumping, use this
Gui, Add, Text, x145 y50 w200 h50, alias +jump_ "+jump;+jump"
Gui, Add, Text, x145 y70 w200 h50, alias -jump_ "-jump;-jump;-jump"
Gui, Add, Text, x145 y90 w200 h50, bind mwheeldown +jump_;
Gui, Add, Text, x25 y110 w400 h50, Testing with jumpbug *experiment - I am currently using . It's better than I thought*
Gui, Add, Text, x125 y130 w300 h50, alias +jb "-duck_;-duck_;-duck_;+jump_;+jump_"
Gui, Add, Text, x125 y150 w300 h50, alias -jb "-jump_;-jump_;-jump_"
Gui, Add, Text, x125 y170 w300 h50, bind "mwheeldown" "+jb"
Gui, Font, s10 Bold cFF0000
Gui, Add, Text, x80 y250 w300 h60, hold mouse4 while ingame to activate
Gui, Font, s10 Bold cFF0000 
Gui, Add, Text, x290 y9 w120 h50, modified by Ryuu
Gui, Font, s12 Bold
Gui, Color, 000000 ; Background color
Gui, Margin, 10, 10
Gui, Show, Center, CS2 Bhop Script
GuiControlGet, result

While !GetKeyState(exit_key, "P") 
{
    If GetKeyState(activation_key, "P") 
    {
        MouseClick, WheelDown  ; Simulate mouse wheel down
        Sleep, % (TICK_64_MS * 0.99) ; Sleep for a specific time
        
        
        

        MouseClick, WheelDown ; Simulate mouse wheel down
        While GetKeyState(activation_key, "P")
        {
            MouseClick, WheelDown
            Sleep, % (TICK_64_MS * 1.99)
        }
    }
    else
    {
        Sleep, 0.99
    }
}

DllCall("timeEndPeriod", UInt, 1)
ExitApp
