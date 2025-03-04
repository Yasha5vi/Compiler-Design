%{
#include <stdio.h>
#include <string.h>

int total_chars = 0;      // To count all characters
int total_words = 0;       // To count words
int total_whitespaces = 0; // To count whitespaces (spaces, tabs, newlines)
%}

%%
[ \t\n] { total_whitespaces++; }
[a-zA-Z_]+ { total_words++; } 
. { total_chars++; }

%%

int yywrap() {
    return 1;
}

int main() {
    FILE *ptr = fopen("in.txt", "r");
    if (!ptr) {
        printf("Error opening file\n");
        return 0;
    }
    yyin = ptr;
    yylex();

    // Printing the results
    printf("Total Characters: %d\n", total_chars);
    printf("Total Words: %d\n", total_words);
    printf("Total Whitespaces: %d\n", total_whitespaces);

    fclose(ptr);
    return 0;
}
