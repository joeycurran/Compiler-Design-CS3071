%{ 
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex();

%}

%token I V X D C M L 
%token EOL

%%

romannum: 
<<<<<<< HEAD
 | romannum num  EOL { printf("%d\n", $2); }
=======
 | romannum num EOL { printf("%d\n", $2); }
>>>>>>> 7983030db955d86563904d06c79ea44e9af5653c
 ;

num: term
  | I V {$$=4;}
  | I X {$$=9;}
  | X L {$$=40}
  | X C {$$=90}
  | C D {$$=400}
  | C M {$$=900}
  | num I V {if($1 )$$ = $1 +4;}
  | num  I X { $$ = $1 + 9; }
<<<<<<< HEAD
  | num X L { $$ = $1 + 40; } 
  | num L C { $$ = $1 + 90; }
  | num C D { $$ = $1 + 400; }
  | num C M { $$ = $1 + 900; }
  | num term { $$ = $1 + $2;}
=======
 | num X L { $$ = $1 + 40; } 
 | num L C { $$ = $1 + 90; }
 | num C D { $$ = $1 + 400; }
 | num C M { $$ = $1 + 900; }
 | num term { $$ = $1 + $2;}
>>>>>>> 7983030db955d86563904d06c79ea44e9af5653c


;

 term :
 | I {$$=1;}
 | V {$$=5;}
 | X {$$=10}
 | L {$$=50}
 | C {$$=100}
 | D {$$=500}
 | M {$$=1000}
 ;

%%

int main()
{
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  printf("%s", s);
  exit(0);
}