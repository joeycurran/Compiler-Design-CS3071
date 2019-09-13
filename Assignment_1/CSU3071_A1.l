
%{
    int evenInt= 0;
    int i;
%}


%%

[0-9]*[02468]+	{evenInt++;};
[0-9]*[13579] {}
\n		{}
.		{}


%%

int main()
{
  yylex();
  printf("%i\n", evenInt);
	return 0;
}