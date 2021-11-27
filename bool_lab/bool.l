%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%%
true  {return TRUE;}
false {return FALSE;}
"|" {return OR;}
"&" {return AND;}
"!" {return NOT;}
"^" {return XOR;}
"(" {return LP;}
")" {return RP;}
\n|.    {return ENTER;}
[ \t] {}
%%
int yywrap() {
    return 1;
}