%{
# include "calcwithvariables.tab.h"
void yyerror(char* s);
%}

%%
":="            { return EQUAL; }
"+"             { return ADD; }
"-"             { return SUB; }
"*"             { return MUL; }
"/"             { return DIV; }
"print"         { return PRINT; }
[a-z]           { yylval = yytext[0]; return CHAR; }
[0-9]+          { yylval = atoi(yytext); return NUM; }
";"             { return SEMICOLON; }
[ \t\n]*        { }
.               { yyerror("syntax error"); }
%%