grammar prog ;
root : declaration function ;
declaration : (declare_include | declare_define)+ ;
declare_include : '[' 'include' '(' declarationtype ')' ']';
declare_define : '[' 'define' LIT 'as' ID ']';
declarationtype : ID '.' ID ;
function : 'main' '[' ']' ':' block ;
block : '{' statement '}' ;
statement :(
 expressionstmt
| selectionstmt
| iterationstmt
| statement_return
| outputstmt
| inputstmt
| breakstmt
)+
;
expressionstmt : expr ',' typeSpecifier ';' ;
expr : expr binop expr | expr relop expr | expr logical_op expr | '(' expr ')' | term ;
statement_return : 'return' expr ';' | 'return' term ';' ;
binop : '+' | '-' | '*' | '/' ;
relop : '==' | '!=' | '<=' | '<' | '>' | '>=' | '=' ;
logical_op : 'and' | 'or' | 'not' ;
selectionstmt : 'if' '[' expr ']' block | 'if' '[' expr ']' block ('elif' '[' expr ']' block)* 'else' block ;
breakstmt : 'break' ;
iterationstmt : whilestmt | loopstmt ;
whilestmt : 'while' '[' expr ']' block ;
loopstmt : 'loop''['loopexpr']' block ;
loopexpr : var '='term 'to' var '=' term ',' 'increment' 'by' term ;
outputstmt : 'write' ':' expr ';' ;
inputstmt : 'read' ':' var ';' ;
var : ID ;
incr_op : '++'| '--' ;
term : ID | LIT ;
typeSpecifier : 'integer' | 'character' | 'float' ;
ID : [a-zA-Z]+ ;
LIT : [0-9]+ ;
WS : [ \t\r\n]+ -> skip ;