/* mywc-linux.l */ 

%option noyywrap nodefault yylineno

%{
    int lines = 0, words = 0, chars = 0;
    int in_word = 0;
%}

%%

\n          { lines++; chars++; in_word = 0; }
[ \t\r]+    { chars += yyleng; in_word = 0; }  // Espaços, tabs e retornos de carro não são palavras
[^ \t\r\n]+ { words++; chars += yyleng; }  // Qualquer sequência que não seja espaço, tab ou nova linha conta como palavra
.           { chars++; }  // Conta caracteres restantes

%%

int main(int argc, char **argv)
{
   if(argc > 1) {
      if(!(yyin = fopen(argv[1], "r"))) {
         printf("error\n");
         return (1);
       }
   }
   yylex();
   printf("%8d%8d%8d %s\n", lines, words, chars, argv[1] ? argv[1] : "stdin");
   return 0;
}
