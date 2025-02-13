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
    int flag = 0;
%}

%%
^[_a-zA-Z][a-zA-Z0-9_]+     {flag = 1;}
.        {flag = 0;}    
\n  {
        if(flag)    printf("\nValid\n");
        else        printf("\nInvalid\n");
    }
%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}
