/*
    Write a lex code to create a DFA that accepts third last element as 'a'
*/

%{
    #include<stdio.h>
%}

%s A B C D E F G H DEAD

%%

<INITIAL>a BEGIN B;
<INITIAL>b BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<INITIAL>[\n] BEGIN INITIAL; {printf("NOT ACCEPTED\n");}

<B>a BEGIN C;
<B>b BEGIN E;
<B>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<B>[\n] BEGIN B; {printf("NOT ACCEPTED\n");}

<C>a BEGIN D;
<C>b BEGIN F;
<C>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<C>[\n] BEGIN C; {printf("NOT ACCEPTED\n");}

<D>a BEGIN D;
<D>b BEGIN F;
<D>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<D>[\n] BEGIN D; {printf("ACCEPTED\n");} 

<E>a BEGIN G;
<E>b BEGIN H;
<E>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<E>[\n] BEGIN E; {printf("NOT ACCEPTED\n");}

<F>a BEGIN G;
<F>b BEGIN H;
<F>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<F>[\n] BEGIN F; {printf("ACCEPTED\n");} 

<G>a BEGIN C;
<G>b BEGIN E;
<G>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<G>[\n] BEGIN G; {printf("ACCEPTED\n");} 

<H>a BEGIN B;
<H>b BEGIN INITIAL;
<H>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<H>[\n] BEGIN H; {printf("ACCEPTED\n");} 

<DEAD>[^\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");} 
<DEAD>[\n] BEGIN DEAD; {printf("NOT ACCEPTED");}

%%

int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}