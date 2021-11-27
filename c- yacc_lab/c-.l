%{
    #include<stdio.h>
    #include<stdlib.h>
%}
Digit [0-9]
Letter [a-zA-Z] 

%%
if|else|while|for|switch|case|var|return|break|throw|catch|import|func|print  {return Keyword;}
"+"|"-"|"*"|"/"|"="|"%"|"&"|"^"|"|"|"&&"|"||"|"!"|"~"|">>"|"<<"|"=="|"!="|"<="|">="|"<"|">"|"++"|"--"   {return Operator;}
";"|","|"."|":"    {return Marker;}
\/\*([^\*^\/]*|[\*^\/*]*|[^\**\/]*)*\*\/    {return Annotation;}
"("|")"|"["|"]"|"{"|"}"    {return Bracket;}
[ \n\t]     {return Blank;}
({Letter}|_)({Letter}|_|{Digit})*  {return ID;}   
("-")?{Digit}+.{Digit}+     {return Num;}   
["'"][a-zA-Z0-9_ !@#$%^&*;,.]+["'"]    {return String;}

%%
int yywrap() {
    return 1;
}