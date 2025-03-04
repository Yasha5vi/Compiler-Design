%{
    #include<stdio.h>
    #include<string.h>
    char key[100];
    char op[100];
    char sep[100];
    char iden[100];
%}

%%
"int"|"float"|"while"|"if"|"else" {strcat(key," ");strcat(key,yytext);}
"+"|"="|"<="|"=="|"*"|"++"  {strcat(op," ");strcat(op,yytext);}
"{"|"}"|";"|","|"("|")" {strcat(sep," ");strcat(sep,yytext);}
[a-zA-Z_][a-zA-Z_0-9]* {strcat(iden," ");strcat(iden,yytext);}
%%

int yywrap(){
    return 1;
}
int main(){
    
    yylex();
    printf("\nKEYWORDS : ");
    puts(key);
    printf("\nOPERATORS : ");
    puts(op);
    printf("\nSEPARTORS : ");
    puts(sep);
    printf("\nIDENTIFIERS : ");
    puts(iden);
}