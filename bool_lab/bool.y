%{
    #include <stdio.h>
    #include <ctype.h>
    #define YYSTYPE int
    void yyerror(char *s);
    int yylex();
%}
%token TRUE FALSE LP RP ENTER
%left OR
%left XOR
%left AND
%right NOT

%%
lines: lines expr ENTER {if ($2==1){printf("outcome: true\n");}else{printf("outcome: false\n");}}
    |lines ENTER
    |
    ;
expr: expr OR expr {$$ = $1 | $3;}
    |expr XOR expr {$$ = $1 ^ $3;}
    |expr AND expr {$$ = $1 & $3;}
    |LP expr RP {$$ = $2;}
    |NOT expr {$$ = !$2;}
    |TRUE {$$ = 1;}
    |FALSE {$$ = 0;}
    ;

%%
int main() {
    return yyparse();
}
#include "lex.yy.c"
void yyerror(char *s) {
    printf("%s\n", s);
}