/*
    write a lex program to check whether an entered email is vaild or not
    write a lex program to check whether the entered number is integer or float
*/

%{
    #include<stdio.h>
    int flag = 0;
%}

%%
^[a-zA-Z0-9._-]+@gmail.com     {flag = 1;}
.   {flag = 0;}
\n  {
        if(flag){
            printf("\nvalid\n");
        }else{
            printf("\nInvalid\n");
        }
    }
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}
