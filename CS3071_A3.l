%{ 
%}

NEW_COUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
OLD_COUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW

%%



[\n|\s|\t| ]*[1][3-9][1-2][\-]{NEW_COUNTY}[\-][1-9][0-9]{0,5}[\n|\s|\t| ]*  {

int year = yytext[1] -'0' ; 
int yearsOld = 9 - year ;
printf("%d\n", yearsOld);

 }

[\n|\s|\t| ]*[0-9][0-9][\-]{OLD_COUNTY}[\-][1-9][0-9]{0,5}[\n|\s|\t| ]* {

int year = yytext[0] - '0';
year *= 10;
year = year + (yytext[1] -'0');

if( year >12){

int yearsOld = (100 - year) + 19;
printf("%d\n", yearsOld);

}
else{

int yearsOld = 19 - year;
printf("%d\n", yearsOld);

}

}

[\n|\s|\t| ]*.*[\n|\s|\t| ]* { printf( "INVALID\n"); }


%%

int main()
{

  yylex();
	return 0;
}