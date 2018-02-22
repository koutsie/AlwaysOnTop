#NoEnv
#NoTrayIcon
SendMode Input


IfExist, %A_MyDocuments%\aot.cfg ;Check if the app has been launched before
{

}
else
{
FileAppend, EnableHelpGui=0`n// Greets from Koutsie 2018!, %A_MyDocuments%\aot.cfg ;Create the file to not show help, and show help.
Gui,Add,Text,x3 y3 w140 h13,Welcome to AlwaysOnTop!
Gui,Font,norm s12,Small Fonts
Gui,Add,GroupBox,x70 y60 w200 h200,Basics:
Gui,Font
Gui,Add,Text,x110 y90 w120 h35,CTRL+SPACE will enable AOT
Gui,Add,Text,x110 y140 w120 h13,PageUp will kill AOT
Gui,Add,Text,x110 y220 w120 h13,Thats all, happy tabbing!
Gui,Add,Text,x307 y297 w21 h13,v1.0
Gui,Show,w330 h313,AOT
return
}

IfExist, %A_MyDocuments%\aot-debug.cfg ;For my own fun - A Splash!
{
SplashImage, C:\Users\Koutsie\Desktop\Dunno\AOT.png, b fs18, 
Sleep, 3000
SplashImage, Off
}
else
{

}

^SPACE::  Winset, Alwaysontop, , A ;If space is pressed, set that window to be always on top!
pgUp::ExitApp ;If the user presses PageUp then quit AOT.
