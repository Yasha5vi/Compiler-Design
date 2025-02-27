%{
    #include<stdio.h>
%}
%%
.   {printf("%c",yytext[0]);}

%%
/*
design a lex code for tokenizing operator, delimitor, separator, identifiers ,keywords of the following C fragment
*/
int yywrap(){
    return 1;
}
int main(){
    FILE *ptr = fopen("in.txt","r");
    if(!ptr){
        printf("Error opening File\n");
        return 0;
    }
    yyin = ptr;
    yylex();
    fclose(ptr);
    return 0;
}