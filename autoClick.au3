;                   ::::::::          
;         :+:      :+:    :+:         
;    +++++++++++  +:+         +++++   
;       +:+      +#+         +#  +#   
;      +#+      +#+         +#        
;     #+#      #+#     +#  +#  +#     
;    ###       ########+   ####+      
;
; tCc|MC_Crafty
; mc_crafty@gmx.com
; peform clicks from the commandline. y u no maus?

Global $button = "primary"
Global $x = ""
Global $y = ""
Global $clicks = 1
Global $speed = 10

;Get Parameters
ReadCmdLineParams()
;Click
MouseClick ( $button, $x, $y, $clicks, $speed )

;Read commandline params
Func ReadCmdLineParams()
    ;Loop through every arguement
    for $i = 1 to $cmdLine[0]
        select
            case $cmdLine[$i] = "-b"
                ;Check for missing arg
                If $i == $cmdLine[0] Then CmdLineHelpMsg()
                ;Make sure the next argument is not another parameter
                If StringLeft($cmdLine[$i+1], 1) == "-" Then
                    CmdLineHelpMsg()
                Else
                    ;Stip white space from the begining and end of the input
                    ;Not alway nessary, but just in case
                    Local $buttonTemp = StringStripWS($cmdLine[$i + 1], 8)
                    Local $buttonUnChecked = StringLower($buttonTemp)
                    If $button == "left" OR $button == "middle" OR $button == "right" OR $button == "primary" OR $button == "secondary" Then
                        $button = $buttonUnChecked
                    Else
                        CmdLineHelpMsg()
                    EndIf
                EndIf

            case $cmdLine[$i] = "-x"
                ;Check for missing arg
                If $i == $cmdLine[0] Then CmdLineHelpMsg()
                ;Make sure the next argument is not another parameter and is a number
                If StringLeft($cmdLine[$i+1], 1) == "-" OR StringIsAlNum($cmdLine[$i+1]) == 0 Then
                    CmdLineHelpMsg()
                Else
                    ;Stip white space from the begining and end of the input
                    ;Not alway nessary, but just in case
                    $x = StringStripWS($cmdLine[$i + 1], 8)
                EndIf

            case $cmdLine[$i] = "-y"
                ;Check for missing arg
                If $i == $cmdLine[0] Then CmdLineHelpMsg()
                ;Make sure the next argument is not another parameter and is a number
                If StringLeft($cmdLine[$i+1], 1) == "-" OR StringIsAlNum($cmdLine[$i+1]) == 0 Then
                    CmdLineHelpMsg()
                Else
                    ;Stip white space from the begining and end of the input
                    ;Not alway nessary, but just in case
                    $y = StringStripWS($cmdLine[$i + 1], 8)
                EndIf

            case $cmdLine[$i] = "-c"
                ;Check for missing arg
                If $i == $cmdLine[0] Then CmdLineHelpMsg()
                ;Make sure the next argument is not another parameter and is a number
                If StringLeft($cmdLine[$i+1], 1) == "-" OR StringIsAlNum($cmdLine[$i+1]) == 0 Then
                    CmdLineHelpMsg()
                Else
                    ;Stip white space from the begining and end of the input
                    ;Not alway nessary, but just in case
                    $clicks = StringStripWS($cmdLine[$i + 1], 8)
                EndIf
                
            case $cmdLine[$i] = "-s"
                ;Check for missing arg
                If $i == $cmdLine[0] Then CmdLineHelpMsg()
                ;Make sure the next argument is not another parameter and is a number
                If StringLeft($cmdLine[$i+1], 1) == "-" OR StringIsAlNum($cmdLine[$i+1]) == 0 Then
                    CmdLineHelpMsg()
                Else
                    If $cmdLine[$i+1] < 0 OR $cmdLine[$i+1] > 100 Then
                        CmdLineHelpMsg()
                    Else
                        ;Stip white space from the begining and end of the input
                        ;Not alway nessary, but just in case
                        $speed = StringStripWS($cmdLine[$i + 1], 8)
                    EndIf
                EndIf
        EndSelect
    Next

    ;Make sure required options are set and if not display the Help Message
    if $x == "" Or $y == "" Then
        CmdLineHelpMsg()
    EndIf
EndFunc

;Show help message for a bad or missing param
Func CmdLineHelpMsg()
    ConsoleWrite('Click from the command line' & @LF & @LF & _
                    'Syntax:' & @tab & 'autoClick.exe [options]' & @LF & @LF & _
                    'Default:' & @tab & 'Display help message.' & @LF & @LF & _
                    'Required Options:' & @LF & _
                    '-x ' & @tab & 'X Position' & @lf & _
                    '-y ' & @tab & 'Y Position' & @lf & _
                    @LF & _
                    'Optional Options:' & @LF & _
                    '-b ' & @tab & 'Button: left, middle, right' & @lf & _
                    '-c ' & @tab & 'Clicks, number of times to click' & @lf & _
                    '-s' & @tab &  'Speed of Clicks, 0 is fast, 100 is slow' & @lf)
    Exit
EndFunc
