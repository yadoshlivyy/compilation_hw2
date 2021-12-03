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
letterU			([A-Z])
letterL			([a-z])
letter_digit	([0-9A-Za-z])
whitespace		([\r\t\n ])
comma			(,)
lparen			(\()
rparen			(\))
lbrace			(\{)
rbrace			(\})
assign			(=)
relop			((<)|(>)|(<=)|(>=))
eq				((==)|(!=))
multdiv			([(*)(/)])
plusminus		([(+)(\-)])
comment			("//"[^\r\n(\r\n)]*)
quote			("\"")
hex_digit		[0-9A-Fa-f]
hexa			{hex_digit}{2}
printable_char ([\x20-\x7E]|\x09|\x0A|\x0D)



%%

 
/* "enum"						return ENUM; */
"void"						return VOID;
"int"						return INT;
"byte"						return BYTE;
"b"							return B;
"bool"						return BOOL;
"const"						return CONST;
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
";"							return SC;
","						return COMMA;
{lparen}					return LPAREN;
{rparen}					return RPAREN;
{lbrace}					return LBRACE;
{rbrace}					return RBRACE;
{assign}					return ASSIGN;
{plusminus}					return PLUSMINUS;
{multdiv}					return MULTDIV;
{relop}						return RELOP;
{eq}						return EQ;
{letter}{letter_digit}*		return ID;
([1-9]{digit}*)|(0)			return NUM;
\"([^\n\r\"\\]|\\[rnt"\\])+\" 	return STRING;	

"//"[^\r\n]*[\r|\n|\r\n]? 	;
{whitespace}				;

.							{output::errorLex(yylineno); exit(0); }

%%


