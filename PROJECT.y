%{

#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();

%}

%token  DATA_TYPE IDENTIFIER OPENING_BRACE  CLOSING_BRACE COMMA NEWLINE OPENING_CURLY_BRACE CLOSING_CURLY_BRACE
%token  RESERVED_WORD CONTENT REFERENCE POINTER VOID_TYPE INLINE

%%
start      : function NEWLINE {printf("Input IS Valid Function Of C++"); exit(0);}
           ;
function   : inline DATA_TYPE prefix identifier OPENING_BRACE parameters CLOSING_BRACE OPENING_CURLY_BRACE content CLOSING_CURLY_BRACE 
           | inline VOID_TYPE identifier OPENING_BRACE parameters CLOSING_BRACE OPENING_CURLY_BRACE content CLOSING_CURLY_BRACE
           ;           
parameters : DATA_TYPE prefix identifier another_parameter
           |
           ;
           
inline     : INLINE
           |
		   ;
		              
prefix     : REFERENCE
           | POINTER
           | POINTER POINTER 
           | POINTER POINTER POINTER
           |
		   ;
		   		              
identifier : IDENTIFIER
           | RESERVED_WORD   {printf("Can NOT Use Keyword As Identifier");YYABORT;}
		   ;  
		            
another_parameter : COMMA DATA_TYPE prefix identifier another_parameter 
                  |
                  ;
			        
content        :  CONTENT content
			   |  IDENTIFIER content
			   |  RESERVED_WORD content
			   |  OPENING_BRACE content
			   |  CLOSING_BRACE content
			   |  POINTER content
			   |  REFERENCE content
			   |  DATA_TYPE content  
			   |
			   ;    
%%

int yyerror(char const* s)
{
	printf("Input IS NOT Valid Function Of C++");
	return 1;
}

int main()
{
	printf("------------------------ PARSER FOR C++ FUNCTION -------------------------\n");
	printf("Enter the C++ function \n");
	yyparse();
	return 0;
}
	
	
