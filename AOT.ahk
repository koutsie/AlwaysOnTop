#NoEnv
#NoTrayIcon ;We dont care for a fancy tray icon :=)
SendMode Input
SetWorkingDir %A_ScriptDir% ;There is no need to install as this will set the working directory to the foldier where the executable is
FileInstall, C:\Users\Koutsie\Desktop\AOT1.1\AOT.ini, %A_ScriptDir%\AOT.ini, 1 ;This will include the INI file to the exe and extract it on the first launch
FileInstall, C:\Users\Koutsie\Desktop\AOT1.1\aaa.png, %A_ScriptDir%\splash.png, 1
IniRead, Splash,%A_ScriptDir%\AOT.ini, Splash, SplashEnable ;Now we check do we have the splash enabled 
IniRead, ShowHelp,%A_ScriptDir%\AOT.ini, ShowHelp, HelpEnable ;Same for the help dialog *

if(Splash = "True") {
    SplashImage, %A_ScriptDir%\splash.png, b fs18, ;Here i set the splash image
    Sleep, 4500
    SplashImage, Off
}

if(ShowHelp = "True") {
    Gui,Add,Text,x3 y3 w140 h13,Welcome to AlwaysOnTop! ;Generic GUI stuff
    Gui,Font,norm s12,Small Fonts
    Gui,Add,GroupBox,x70 y60 w200 h200,Basics:
    Gui,Font
    Gui,Add,Text,x110 y90 w120 h35,CTRL+SPACE will enable AOT
    Gui,Add,Text,x110 y140 w120 h13,PageUp will kill AOT
    Gui,Add,Text,x110 y220 w120 h13,Thats all, happy tabbing!
    Gui,Add,Text,x307 y297 w21 h13,v1.1
    Gui,Show,w330 h313,AOT
    IniWrite, False, %A_ScriptDir%\AOT.ini, ShowHelp, HelpEnable ;As you can see here *we disable the help screen after the user has seen it once
}
return

^SPACE::Winset, Alwaysontop, , A ;If space is pressed, set that window to be always on top!
pgUp::ExitApp ;If the user presses PageUp then quit AOT.
