%{
    #include <stdio.h>
    #include <string.h>

    int words = 0,chars = 0,spaces = 0;
%}

%%

[ \t\n]         {spaces++;}
[a-zA-Z0-9]+    {
    words++;
    for(int i=0;i<yyleng;i++){
        if(!(yytext[i] <= '0' && yytext[i] >= '9')){
            chars++;
        }
    }
}
.               {chars++;}

%%

int yywrap() {
    return 1;
}

int main() {
    FILE *ptr = fopen("in.txt", "r");
    FILE *itr = fopen("out.txt","w");
    if (!ptr || !itr) {
        printf("Error opening file\n");
        return 0;
    }
    yyin = ptr;
    yylex();
    fprintf(itr,"Total Characters: %d\n", chars);
    fprintf(itr,"Total Words: %d\n", words);
    fprintf(itr,"Total Whitespaces: %d\n", spaces);
    fclose(ptr);
    fclose(itr);
    return 0;
}
