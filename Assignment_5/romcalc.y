%{ 
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yyparse();

%}

%token Z I V X D C M L  
%token ADD SUB DIV MUL
%token LB RB
%token EOL

%%

romannum: 
 | romannum exp EOL { if ($2==0) printf("%Z\n"); else ans_to_roman($2);}
 ;

 
 exp: factor 
| exp ADD factor { $$ = $1 + $3; }
| exp SUB factor { $$ = $1 - $3; }

 ;

factor: brac
| factor MUL brac { $$ = $1 * $3; }
| factor DIV brac { if($3!=0) $$ = $1 / $3; else yyerror("synatax error\n"); }
 ;

 brac: num
 | LB exp RB {$$ = $2; }
 | LB exp { yyerror("syntax error\n"); }
 ;

 num : term
  
  | num term { if($2 == 1) {if($1 == 4 || $1 == 9) yyerror("syntax error\n"); else $$ = $1 + $2;}
				  if($2 == 4) {if($1 == 4) yyerror("syntax error\n"); else $$ = $1 + $2;}
				  if($2 == 5) {if($1 == 5) yyerror("syntax error\n"); else $$ = $1 + $2;}
				  if($2 == 9) {if($1 == 9) yyerror("syntax error\n"); else $$ = $1 + $2;}
				  if($2 == 10) {if($1 == 40 || $1 == 90) yyerror("syntax error\n"); else $$ = $1 + $2;}
				  if($2 == 100) {if($1 == 400 || $1 == 900) yyerror("syntax error\n"); else $$ = $1 + $2;}
				  $$ = $1 + $2;		  
				 }


;

 term :
 | z {$$=0;}
 | I V {$$=4;}
 | I X {$$=9;}
 | X L {$$=40;}
 | X C {$$=90;}
 | C D {$$=400;}
 | C M {$$=900;}
 | I {$$=1;}
 | V {$$=5;}
 | X {$$=10;}
 | L {$$=50;}
 | C {$$=100;}
 | D {$$=500;}
 | M {$$=1000;}
 ;

%%

void ans_to_rom (int number) {
  int neg = 0;
  if(number < 0) {
    number -= number*2;
    neg = 1;
  }
  	if (neg == 1){
			printf("-");
			
		  } 
	
  	while (number > 0) {
		  
		  
		if(number >= 1000) {
			number -= 1000;
			printf("M");
		}
		else if(number >= 900) {
			number -= 900;
			printf("CM");
		}
		else if(number >= 500) {
			number -= 500;
			printf("D");
		}
		else if(number >= 400) {
			number -= 400;
			printf("CD");
		}
		else if(number >= 100) {
			number -= 100;
			printf("C");
		}
		else if(number >= 90) {
			number -= 90;
			printf("XC");
		}
		else if(number >= 50) {
			number -= 50;
			printf("L");
		}
		else if(number >= 40) {
			number -= 40;
			printf("XL");
		}
		else if(number >= 10) {
			number -= 10;
			printf("X");
		}
		else if(number >= 9) {
			number -= 9;
			printf("IX");
		}
		else if(number >= 5) {
			number -= 5;
			printf("V");
		}
		else if(number >= 4) {
			number -= 4;
			printf("IV");
		}
		else if(number >= 1) {
			number -= 1;
			printf("I");
		}
	}
	printf("\n");
  }



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
