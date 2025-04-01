%{
    #include<stdio.h>
    #include<string.h>
    char key[100] = "";
    char op[100] = "";
    char sep[100] = "";
    char iden[100] = "";
%}

%%
"int"|"float"|"while"|"if"|"else"   {strcat(key," ");strcat(key,yytext);}
"+"|"="|"<="|"=="|"*"|"++"          {strcat(op," ");strcat(op,yytext);}
"{"|"}"|";"|","|"("|")"             {strcat(sep," ");strcat(sep,yytext);}
[a-zA-Z_][a-zA-Z_0-9]*              {strcat(iden," ");strcat(iden,yytext);}
%%

int yywrap(){
    return 1;
}
int main(){
    FILE* ptr = fopen("in.txt","r");
    FILE* itr = fopen("out.txt","w");
    if(!ptr || !itr){
        printf("Error Opening File\n");
        return 0;
    } 
    yyin = ptr;
    yylex();
    fprintf(itr, "KEYWORDS : %s\n",     key);
    fprintf(itr, "OPERATORS : %s\n",    op);
    fprintf(itr, "SEPARATORS : %s\n",   sep);
    fprintf(itr, "IDENTIFIERS : %s\n",  iden);
    return 0;
}