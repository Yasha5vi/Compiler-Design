/*
DFA to check string of even a and even b
*/
%{
#include<stdio.h>    
%}

%s A B C DEAD 

%% 
<INITIAL>a BEGIN A; 
<INITIAL>b BEGIN C; 
<INITIAL>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");} 
<INITIAL>\n BEGIN INITIAL; {printf("ACCEPTED\n");} 

<A>a BEGIN INITIAL; 
<A>b BEGIN B; 
<A>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<A>[\n] BEGIN INITIAL; {printf("NOT ACCEPTED\n");} 

<B>a BEGIN C; 
<B>b BEGIN A;
<B>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<B>[\n] BEGIN INITIAL; {printf("NOT ACCEPTED\n");}  

<C>a BEGIN B; 
<C>b BEGIN INITIAL; 
<C>[^ab\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");}
<C>[\n] BEGIN INITIAL; {printf("NOT ACCEPTED\n");} 

<DEAD>[^\n] BEGIN DEAD; {printf("INVALID in DEAD State\n");} 
<DEAD>[\n] BEGIN INITIAL; {printf("NOT ACCEPTED");}

%% 
int yywrap(){
    return 1;
}

int main(){
    printf("Enter string: "); 
    yylex(); 
    return 0; 
}
