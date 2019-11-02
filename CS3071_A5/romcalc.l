%option noyywrap

%{
# include "romcalc.tab.h"
void yyerror(char *s);
%}

%%

"z" {return z;}
"I" {return I;}
"V"  {return V;}
"X" {return X;}
"L" {return L;}
"C" {return C;}
"D" {return D;}
"M" {return M;}
"*" {return MUL;}
"/"	{return DIV;}
"+"	{return ADD;}
"-"	{return SUB;}
"{" {return LB;}
"}"	{return RB;}
\n {return EOL;}
[ \t] {}
. {yyerror("syntax error\n");}
%%