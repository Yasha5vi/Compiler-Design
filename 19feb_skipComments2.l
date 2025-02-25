%{
    #include <stdio.h>
    #include <stdlib.h>
    int count = 0; // To count comments
%}

%%

"//".*   { count++; }

"/*"([^*]|\*+[^*/])*\*+"/" { count++; }


.|\n    { fprintf(yyout, "%s", yytext);
	  printf ("%s",yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    FILE *f1, *f2;

    // Open input file
    f1 = fopen("comment.c", "r");
    if (!f1) {
        printf("Error: Cannot open input file.\n");
        return 1;
    }
    yyin = f1;  // Set Lex input file

    // Open output file
    f2 = fopen("comment1.c", "w");
    if (!f2) {
        printf("Error: Cannot open output file.\n");
        fclose(f1);
        return 1;
    }
    yyout = f2;  // Set Lex output file

    // Call Lex Scanner
    yylex();

    // Print comment count
    printf("The number of comments removed: %d\n", count);

    // Close files
    fclose(f1);
    fclose(f2);

    return 0;
}