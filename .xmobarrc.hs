Config { font = "xft:DejaVu Sans Mono:size=9:antialias=true", 
    bgColor = "black",
    fgColor = "grey",
    position = TopW L 90,
    lowerOnStart = True,
    commands = [ Run Weather "KMOB" ["-t"," <tempF>F","-L","64","-H","77","--normal","green","--high","red","--low","lightblue"] 300,
        Run MultiCpu ["-L","3","-H","50","--normal","green","--high","red"] 10,
        Run Memory ["-t","Mem: <usedratio>%"] 10,
        Run Swap [] 10,
        Run Date "%a %b %_d %H:%M" "date" 10,
        Run Battery ["-t","Batt: <left>%"] 60,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %battery%   %multicpu%   %memory%   %swap%   Mobile: %KMOB%   <fc=#ee9a00>%date%</fc>"
}
