/*
    write a lex program for a valid identifier for the given input
    valid identifier
    no space
    underscore se start ho sakta hai
    variable+digit

    ^[_a-zA-Z]+   
*/


%{
    #include<stdio.h>
%}

%%
"float"|"int"|"if"|"else"|"while"|"return" { printf("ok");}
[_a-zA-Z]([a-zA-Z0-9_])*     {  printf("Valid Identifier\n");   }
.*                           {  printf("Invalid Identifier\n"); }    
%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}
