#include <stdio.h>
#include <string.h>
#include "e2.tab.h"  // Arquivo gerado pelo Flex com as defini��es de token

extern int yylex();
extern int yylval;

void yyrestart(FILE *input_file);

int main() {
    int token;
    char input[1024];  // Buffer para armazenar a entrada

    printf("Digite uma express�o aritm�tica (ou CTRL+D para sair):\n");

    while (fgets(input, sizeof(input), stdin) != NULL) {
        // Reinicia o analisador l�xico para ler a nova linha
        yy_scan_string(input);

        // Processa os tokens da linha
        while ((token = yylex()) != 0) {
            switch (token) {
                case NUMBER:
                    printf("N�mero: %d\n", yylval);
                    break;
                case PLUS:
                    printf("Operador: +\n");
                    break;
                case MINUS:
                    printf("Operador: -\n");
                    break;
                case MULT:
                    printf("Operador: *\n");
                    break;
                case DIV:
                    printf("Operador: /\n");
                    break;
                case ERROR:
                    printf("Erro l�xico: %s\n", yytext);
                    break;
                default:
                    printf("Token desconhecido: %d\n", token);
                    break;
            }
        }

        printf("Digite outra express�o aritm�tica (ou CTRL+D para sair):\n");
    }

    return 0;
}
}
