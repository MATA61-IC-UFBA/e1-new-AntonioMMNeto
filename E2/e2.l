%{
#include <stdio.h>
#include <ctype.h>

enum yytokentype {
    NUMBER = 256,
    PLUS = '+',
    MINUS = '-',
    MULT = '*',
    DIV = '/',
    ERROR = 258
};

int yylval;  // Para armazenar o valor dos números
%}

DIGIT   [0-9]+

%%

{DIGIT}   { yylval = atoi(yytext); return NUMBER; }
"+"       { return PLUS; }
"-"       { return MINUS; }
"*"       { return MULT; }
"/"       { return DIV; }
[ \t\n]+  { /* Ignorar espaços em branco */ }
.         { return ERROR; }

%%

int yywrap() {
    return 1;
}

