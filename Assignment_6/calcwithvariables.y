%{
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
int yylex();
void yyerror(char* s);

void setSymbol(char x, int val);
int getSymbol(char x);

int hasValue(char x);
int characters ['z'-'a'];
int values ['z'-'a'];

%}

%token EQUAL ADD SUB MUL DIV PRINT CHAR NUM SEMICOLON

%%
calclist:
 | calclist statement SEMICOLON
 ;

statement: CHAR EQUAL exp { setSymbol($1, $3); }
 | PRINT exp               { printf("%d\n", $2); }
 ;

exp: exp ADD factor        { $$ = $1 + $3; }
 | exp SUB factor         { $$ = $1 - $3; }
 | factor                  { $$ = $1; }
 ;

factor: factor MUL value      { $$ = $1 * $3; }
 | factor DIV value           { $$ = $1 / $3; }
 | value                      { $$ = $1; }
 ;

value: SUB value            { $$ = -$2; }
 | CHAR                      { if (hasValue($1)){$$ = getSymbol($1);}
                              else {yyerror("syntax error");}
                            }
 | NUM                      { $$ = $1; }
 ;

%%


int hasValue(char x)
{
  int i = x - 'a';
  return values[i];
}

void setSymbol(char x, int val)
{
  int i = x - 'a';
  characters[i] = val;
  values[i] = 1;
}

int getSymbol(char x)
{
  int i = x - 'a';
  return characters[i];

}



int main()
{
  yyparse();
  return 0;
}

void yyerror(char* s)
{
  printf("%s\n", s);
  exit(0);
}