all: yacc lex
	g++ lex.yy.c y.tab.c -ll -o prelab2

yacc: prelab2.y
	yacc -d prelab2.y

lex: prelab2.l
	lex prelab2.l
