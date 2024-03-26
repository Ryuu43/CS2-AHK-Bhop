#Persistent
#NoEnv

DllCall("timeBeginPeriod", UInt, 1)

; Set the process priority to REALTIME_PRIORITY_CLASS
Process, Priority, , R

SetTitleMatchMode, 2  
SetTitleMatchMode, Fast ; Faster matching
TICK_64_MS := 15.6
exit_key := "End"
activation_key := "xButton1"

Gui, Font, cFFFFFF 
Gui, Add, Text, x10 y10 w50 h50, Important :
Gui, Font, cFFFFFF 
Gui, Add, Text, x70 y10 w200 h50, Make sure put this command in console.
Gui, Font, c00FF1D 
Gui, Add, Text, x145 y30 w220 h50, They fix the tick i think
Gui, Add, Text, x140 y50 w200 h50, no longer need de-subtick binds
Gui, Add, Text, x145 y70 w200 h50, just use the default one 
Gui, Add, Text, x145 y90 w200 h50, have fun
Gui, Add, Text, x145 y110 w300 h50, xxxxxxxxxxxxxxxxxxxxxxxx
Gui, Add, Text, x145 y130 w200 h50, xxxxxxxxxxxxxxxxxxxxxxxxx
Gui, Font, s10 Bold cFF0000
Gui, Add, Text, x80 y150 w300 h60, hold mouse4 while ingame to activate
Gui, Font, s10 Bold cFF0000 
Gui, Add, Text, x290 y9 w120 h50, modified by Ryuu43
Gui, Font, s12 Bold
Gui, Color, 000000 ; Background color
Gui, Margin, 10, 10
Gui, Show, Center, CS2 Bhop Script
GuiControlGet, result

While !GetKeyState(exit_key, "P") 
{
    If GetKeyState(activation_key, "P") 
    {
        Send,{space}
        Sleep, % (TICK_64_MS * 1) ; Sleep for a specific time
        
        
        

        Send,{space}
        While GetKeyState(activation_key, "P")
        {
            Send,{space}
            Sleep, % (TICK_64_MS * 2)
        }
    }
    else
    {
        Sleep, 1
    }
}

DllCall("timeEndPeriod", UInt, 1)
ExitApp
