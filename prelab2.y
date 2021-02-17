%{
#include <stdio.h>
#include "y.tab.h"
#include "y.tab.h"
extern FILE *yyin;
extern int yylex();
int numOFun=0;
%}
%token DEFRSW FUNNAME OP CP COLON COMMA TAB RETURN
%%
functions:
		function functions
		|
		function
		;
function: 
		DEFRSW fun_name COLON fun_body {numOFun++;}
		;
fun_name:
		FUNNAME fun_parameter
		;
fun_parameter:
		OP parameters CP
		;
parameters:
		parameter
		|
		parameter COMMA parameters
		|
		/* empty */
		;
parameter:
		FUNNAME
		;
fun_body:
		TAB return_part
		;
return_part:
		RETURN return_parameters
		;
return_parameters:
		return_parameter
		|
		return_parameter COMMA return_parameters
		;
return_parameter:
		FUNNAME
		;
%%
int yyerror(char *s)
{
	fprintf(stderr,"%s\n",s);
	return 0;
}
int yywrap(){
	return 1;
}
int main(int argc, char *argv[])
{
    /* Call the lexer, then quit. */
    yyin=fopen(argv[1],"r");
    yyparse();
	printf("Funtion number: %d\n", numOFun);
    fclose(yyin);
    return 0;
}