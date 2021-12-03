%{

/* Declarations section */
#include <stdio.h>
#include <cstdlib>
#include "output.hpp"
#include "parser.tab.hpp"
%}

%option yylineno
%option noyywrap
digit   		([0-9])
letter  		([a-zA-Z])
letter_digit	([0-9A-Za-z])
whitespace		([\r\t\n ])
sc				(;)
comma			(,)
lparen			(\()
rparen			(\))
lbrace			(\{)
rbrace			(\})
assign			(=)
relop			((==)|(!=)|(<)|(>)|(<=)|(>=))
binop		([(+)(\-)(*)(/)])





%%

 
"void"						return VOID;
"int"						return INT;
"byte"						return BYTE;
"b"							return B;
"bool"						return BOOL;
"const"                     return CONST;
"and"						return AND;
"or"						return OR;
"not"						return NOT;
"true"						return TRUE;
"false"						return FALSE;
"return"					return RETURN;
"if"						return IF;
"else"						return ELSE;
"while"						return WHILE;
"break"						return BREAK;
"continue"					return CONTINUE;
{sc}						return SC;
{comma}						return COMMA;
{lparen}					return LPAREN;
{rparen}					return RPAREN;
{lbrace}					return LBRACE;
{rbrace}					return RBRACE;
{assign}					return ASSIGN;
{relop}						return RELOP;
{binop}						return BINOP;
{letter}{letter_digit}*		return ID;
([1-9]{digit}*)|(0)			return NUM;
\"([^\n\r\"\\]|\\[rnt"\\])+\" 	return STRING;	

"//"[^\r\n]*[\r|\n|\r\n]? 	;
{whitespace}				;

.							{output::errorLex(yylineno); exit(0); }

%%


