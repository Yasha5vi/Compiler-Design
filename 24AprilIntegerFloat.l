/*
    DFA to check whether the entered input is integer float or IDENTIFIER
    code needs some correction
*/

%{
    #include<stdio.h>
%}

%s A B C D E DEAD

%%

<INITIAL>[0-9] BEGIN B;
<INITIAL>[_a-zA-Z] BEGIN E;
<INITIAL>[^0-9_a-zA-Z\n] BEGIN DEAD; {printf("INVALID NUMBER\n");}
<INITIAL>[\n] BEGIN INITIAL; {printf("INVALID NUMBER\n");}

<B>[0-9] BEGIN B;
<B>[.] BEGIN C;
<B>[^0-9.\n] BEGIN DEAD;{printf("INVALID NUMBER\n");}
<B>[\n] BEGIN B;{printf("INTEGER\n");}

<C>[0-9] BEGIN D;
<C>[^0-9\n] BEGIN DEAD;{printf("INVALID NUMBER\n");}
<C>[\n] BEGIN C;{printf("INVALID NUMBER\n");} 

<D>[0-9] BEGIN D;
<D>[^0-9\n] BEGIN DEAD;{printf("INVALID NUMBER\n");}
<D>[\n] BEGIN D;{printf("FLOAT\n");}

<E>[_a-zA-Z] BEGIN E;
<E>[^_a-zA-Z\n] BEGIN DEAD;{printf("INVALID IDENTIFIER\n");}
<E>[\n] BEGIN E;{printf("VALID IDENTIFIER\n");}

<DEAD>[^\n] BEGIN DEAD; {printf("INVALID NUMBER\n");}
<DEAD>[\n] BEGIN DEAD; {printf("INVALID NUMBER\n");}

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}