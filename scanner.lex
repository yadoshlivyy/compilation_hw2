%{

/*  primary declaratrion section */
#include <stdio.h>
#include <cstdlib>
#include "output.hpp"
#include "parser.tab.hpp"
%}

%option yylineno
%option noyywrap
digit   		([0-9])
letter  		([a-zA-Z])
letter_or_digit	([0-9A-Za-z])
whitespace_endl_or_tab		([\r\t\n ])
sc				(;)
comma			(,)
left_paren			(\()
right_paren			(\))
left_brace			(\{)
right_brace			(\})
assignement			(=)
relative_op			((<)|(>)|(<=)|(>=))
equality_op				((==)|(!=))
div_or_mult			([(*)(/)])
plus_or_minus		([(+)(\-)])





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
{left_paren}					return LPAREN;
{right_paren}					return RPAREN;
{left_brace}					return LBRACE;
{right_brace}					return RBRACE;
{assignement}					return ASSIGN;
{plus_or_minus}					return PLUSMINUS;
{div_or_mult}					return MULTDIV;
{relative_op}						return RELOP;
{equality_op}						return EQ;
{letter}{letter_or_digit}*		return ID;
([1-9]{digit}*)|(0)			return NUM;
\"([^\n\r\"\\]|\\[rnt"\\])+\" 	return STRING;	

"//"[^\r\n]*[\r|\n|\r\n]? 	;
{whitespace_endl_or_tab}				;

.							{output::errorLex(yylineno); exit(0); }

%%


