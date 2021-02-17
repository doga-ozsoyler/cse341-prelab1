digit	[0-9]
letter	[A-Za-z]
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
extern int yylval;
int numOfFun=0;
%}
%%
def return DEFRSW;
return	return RETURN;
{letter}({letter}|{digit})* return FUNNAME;
\(	return OP;
\)	return CP;
:	return COLON;
,	return COMMA;
\t	return TAB;
.|\n
%%