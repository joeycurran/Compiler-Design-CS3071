%option noyywrap

%{
# include "roman.tab.h"
void yyerror(char *s);
%}

%%

"I" {return I;}
"V"  {return V;}
"X" {return X;}
"L" {return L;}
"C" {return C;}
"D" {return D;}
"M" {return M;}
\n {return EOL;}

. {yyerror("syntax error\n");}
%%