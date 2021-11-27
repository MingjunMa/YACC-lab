%{
    #include <stdio.h>
    #include <ctype.h>
    #define YYSTYPE int
    void yyerror(char *s);
    int yylex();
%}
%token Keyword Marker Operator Annotation Bracket Blank ID Num String

%%
calculate: ID Operator ID {printf("calculate\n");};
assigment: Keyword Blank ID Operator Num {printf("assigment\n");}
         | Keyword Blank ID Operator String {printf("assigment\n");};
annotation: Annotation {printf("annotation\n");}

%%
int main() {
    return yyparse();
}
#include "lex.yy.c"
void yyerror(char *s) {
    printf("%s\n", s);
}