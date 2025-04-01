%{
    #include <stdio.h>
    #include <stdlib.h>
    int count = 0;
%}

%%

"//".*                      { count++; }
"/*"([^*]|\*+[^*/])*\*+"/"  { count++; }
.|\n                        { fprintf(yyout, "%s", yytext);}

%%

int yywrap() {
    return 1;
}

int main() {
    FILE *f1, *f2;
    f1 = fopen("in.c", "r");
    f2 = fopen("out.c", "w");

    if (!f1 || !f2) {
        printf("Error: Cannot open input file.\n");
        return 1;
    }
    yyin = f1; 
    yyout = f2;
    yylex();
    printf("The number of comments removed: %d\n", count);
    fclose(f1);
    fclose(f2);
    return 0;
}