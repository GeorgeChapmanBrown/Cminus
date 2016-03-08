/*
  Created By: Fei Song
  File Name: tiny.flex
  To Build: jflex tiny.flex

  and then after the parser is created
    javac Lexer.java
*/
   
/* --------------------------Usercode Section------------------------ */
   
import java_cup.runtime.*;
      
%%
   
/* -----------------Options and Declarations Section----------------- */
   
/* 
   The name of the class JFlex will create will be Lexer.
   Will write the code to the file Lexer.java. 
*/
%class Lexer

/*
  The current line number can be accessed with the variable yyline
  and the current column number with the variable yycolumn.
*/
%line
%column
    
/* 
   Will switch to a CUP compatibility mode to interface with a CUP
   generated parser.
*/
%cup
   
/*
  Declarations
   
  Code between %{ and %}, both of which must be at the beginning of a
  line, will be copied letter to letter into the lexer class source.
  Here you declare member variables and functions that are used inside
  scanner actions.  
*/
%{   
    /* To create a new java_cup.runtime.Symbol with information about
       the current token, the token will have no value in this
       case. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   

/*
  Macro Declarations
  
  These declarations are regular expressions that will be used latter
  in the Lexical Rules Section.  
*/
   
/* A line terminator is a \r (carriage return), \n (line feed), or
   \r\n. */
LineTerminator = \r|\n|\r\n
   
/* White space is a line terminator, space, tab, or form feed. */
WhiteSpace     = {LineTerminator} | [ \t\f]
   
/* A literal integer is is a number beginning with a number between
   one and nine followed by zero or more numbers between zero and nine
   or just a zero.  */
digit = [0-9]
number = {digit}+
   
/* A identifier integer is a word beginning a letter between A and
   Z, a and z, or an underscore followed by zero or more letters
   between A and Z, a and z, zero and nine, or an underscore. */
letter = [a-zA-Z]
identifier = {letter}+
   
%%
/* ------------------------Lexical Rules Section---------------------- */
   
/*
   This section contains regular expressions and actions, i.e. Java
   code, that will be executed when the scanner matches the associated
   regular expression. */

\/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+\/   { System.out.print(yytext()); /* skip comments */ }
   
"if"               { System.out.print(yytext()); return symbol(sym.IF); }
"else"             { System.out.print(yytext()); return symbol(sym.ELSE); }
"int"              { System.out.print(yytext()); return symbol(sym.INT); }
"return"           { System.out.print(yytext()); return symbol(sym.RETURN); }
"void"             { System.out.print(yytext()); return symbol(sym.VOID); }
"while"            { System.out.print(yytext()); return symbol(sym.WHILE); }

"+"                { System.out.print(yytext()); return symbol(sym.PLUS); }
"-"                { System.out.print(yytext()); return symbol(sym.MINUS); }
"*"                { System.out.print(yytext()); return symbol(sym.MULT); }
"/"                { System.out.print(yytext()); return symbol(sym.DIV); }
"<"                { System.out.print(yytext()); return symbol(sym.LESS_THAN); }
"<="               { System.out.print(yytext()); return symbol(sym.LESS_THAN_EQUAL); }
">"                { System.out.print(yytext()); return symbol(sym.GREATER_THAN); }
">="               { System.out.print(yytext()); return symbol(sym.GREATER_THAN_EQUAL); }
"=="               { System.out.print(yytext()); return symbol(sym.EQUAL); }
"!="               { System.out.print(yytext()); return symbol(sym.NOT_EQUAL); }
"="                { System.out.print(yytext()); return symbol(sym.ASSIGN); }
";"                { System.out.print(yytext()); return symbol(sym.SEMICOLON); }
","                { System.out.print(yytext()); return symbol(sym.COMMA); }
"("                { System.out.print(yytext()); return symbol(sym.LBRACKET); }
")"                { System.out.print(yytext()); return symbol(sym.RBRACKET); }
"["                { System.out.print(yytext()); return symbol(sym.LSQUARE_BRACKET); }
"]"                { System.out.print(yytext()); return symbol(sym.RSQUARE_BRACKET); }
"{"                { System.out.print(yytext()); return symbol(sym.LCURLY_BRACKET); }
"}"                { System.out.print(yytext()); return symbol(sym.RCURLY_BRACKET); }


{number}                                      { System.out.print(yytext()); return symbol(sym.NUM, Integer.parseInt(yytext())); }
{identifier}                                  { System.out.print(yytext()); return symbol(sym.ID, yytext()); }
{WhiteSpace}+                                 { System.out.print(yytext()); /* skip whitespace */ }   
.                                             { System.out.print(yytext()); return symbol(sym.error); }