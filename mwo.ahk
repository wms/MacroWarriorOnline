;; Start config
team1 = Target spotted in{Space}
team2 = Multiple targets spotted in{Space}
team3 = Focus fire on{Space}
team4 = Enemy flanking left{Enter}
team5 = Enemy flanking right{Enter}
team6 = I need help in{Space}
team7 = Team Message 7{Enter}
team8 = Team Message 8{Enter}
team9 = Team Message 9{Enter}

all1 = Good luck, have fun{Enter}
all2 = Good game{Enter}
all3 = All message 3{Enter}
all4 = All message 4{Enter}
all5 = All message 5{Enter}
all6 = All message 6{Enter}
all7 = All message 7{Enter}
all8 = All message 8{Enter}
all9 = All message 9{Enter}
;; End config

#SingleInstance Force
#InstallKeybdHook
SendMode Event
#UseHook

mode := false

init:
{
    Gui, Show, w200 h210, MacroWarrior Online
    Gui, Add, Text, x10 y10 w200 vmodeLabel
    Gui, Add, Text, x10 y180 w200 vfooterLabel
    Loop 9 {
        y := 20 + a_index * 15
        Gui, Add, Text, x10 y%y% w180 vlabel%a_index%
    }

    reset()
    return
}

GuiClose:
ExitApp

F1::
{
    mode = team
    guicontrol, , modeLabel, Send message to Team

    Loop 9 {
        text := a_index . ". " . team%a_index%
        guicontrol, , label%a_index%, %text%
    }

    guicontrol, , footerLabel, ESC. Cancel
}
return

F2::
{
    mode = all
    guicontrol, , modeLabel, Send message to All

    Loop 9 {
        text := a_index . ". " . all%a_index%
        guicontrol, , label%a_index%, %text%
    }

    guicontrol, , footerLabel, ESC. Cancel
}
return

1::
2::
3::
4::
5::
6::
7::
8::
9::
{
    if(mode) {
        if(mode == "all") {
            Send t
        } else {
            Send y
        }
        Sleep 50
        message := %mode%%a_thishotkey%
        Send %message%

        reset()

        return
    }
    Send %a_thishotkey%
}

Esc::
{
    reset()
}

reset() {
    global mode

    guicontrol, , modeLabel,

    Loop 9 {
        guicontrol, , label%a_index%
    }
    guicontrol, , label1, F1. Team-chat Macros
    guicontrol, , label2, F2. All -chat Macros
    guicontrol, , footerLabel

    mode := false

    return
}
