%{
 // Write all the supporting C - code declaration / definations   

 // Define all supportive data structures BEGIN

 // Define all supportive data structures END

 // dedicated to declare all global variables which parser will use BEGIN 
#ifdef __cplusplus
extern "C" {
#endif

int yylex(void);

#ifdef __cplusplus
}
#endif
 char lex_buffer[512];

 // dedicated to declare all global variable which the parser will use END

 #include "MexprEnums.h"
%}

%%

  // comofsldfjsldfj

\n { 
    return PARSER_EOL; 
 }


0|-?[1-9][0-9]* {
    return MATH_C_INT;
}

-?[0-9]*\.[0-9]+ {

    return MATH_C_DOUBLE;
}

[a-zA-Z0-9_]+ {

    return MATH_C_VARIABLE;
}

(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9]) {
    return MATH_C_IPV4;
}

[ ] {
    // for space to be ignored
    
}

. {
    printf("ignored non parsable character -> %s\n", yytext);
}

%%

// C main functions

int main(int argc, char** argv){

    printf("Number of args -> %d\t First Args -> %s\n", argc, argv[0]);
        while(1){
            fgets(lex_buffer, sizeof(lex_buffer), stdin);
            
            if(lex_buffer[0] == '\n'){
                lex_buffer[0] = 0;
                continue;
            }

            yy_scan_string(lex_buffer);
            int token_code;
            token_code = yylex();

            while (token_code != PARSER_EOL){
                printf("token code -> %d token -> %s token len -> %lu\n", token_code, yytext, yyleng);
                token_code = yylex();
            }
        }
    return 0;
}
