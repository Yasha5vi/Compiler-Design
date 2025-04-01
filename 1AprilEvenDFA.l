%{
    #include<stdio.h>
    extern FILE* yyin;
    extern FILE* yyout;
%}

%%
(aa|bb|(ab|ba)(aa|bb)*(ab|ba))*         fprintf(yyout,"Result : Accepted\n");
.*                                      fprintf(yyout,"Result : Rejected\n");
%%
int yywrap(){
    return 1;
}
int main(){
    FILE* f1 = fopen("in.txt","r");
    FILE* f2 = fopen("out.txt","w");
    if(!f1 || !f2){
        printf("Error opening file \n");
        return 0;
    }
    yyin = f1;
    yyout = f2;
    yylex();
    fclose(f1);
    fclose(f2);
    return 0;
}