%{
    	char testCode [1000];
%}


%%

\*\*.* {}
\{[^\}]*\} {}
\"[^\"]*\" {strcat(testCode, yytext);}
\{[^\}]* {strcat(testCode,"syntax error\n");}
\[^\{]*\} {strcat(testCode,"syntax error\n"); return 0;}
\} {strcat(testCode,"syntax error\n"); return 0;}
\n {strcat(testCode, yytext);}
. {strcat(testCode, yytext);}

%%

int main(){
	yylex();
	printf("%s", testCode);
	return 0;
}
	 
	