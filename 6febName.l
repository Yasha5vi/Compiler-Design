%{
    #include<stdio.h>
%}

%%
   {
        printf("Input name is  : %s \n",yytext);
   }
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
