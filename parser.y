%{
#include <stdio.h>
void yyerror(char* errorinfo);
int yylex(void);
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token OP CP
%token EOL

%%

calclist: /* nothing -- matches beginning of input */
 | calclist exp EOL { printf("= %d\n", $2); } /* EOL is end of an expression */
 | calclist EOL { printf("> "); } /* blank line or comment */
 ;

exp: factor /* default $$ = $1 */
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 | exp ABS factor { $$ = $1 | $3; }
 ;

factor: term /* default $$ = $1 */
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;

term: NUMBER /* default $$ = $1 */
 | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
 | OP exp CP { $$ = $2; }
 ;

%%

int main(int argc, char** argv)
{
 printf("> ");
 return yyparse();
}

void yyerror(char* s)
{
 fprintf(stderr, "Error: %s\n", s);
}
