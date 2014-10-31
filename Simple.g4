grammar Simple;

// lexer

fragment DIGIT
    :   ('0'..'9')+
    ;

INTEGER
    :   ('+' | '-')? DIGIT+
    ;

ADD
    :   '+'
    ;

MULTIPLY
    :   '*'
    ;

OPEN_PARENTHESIS
    :   '('
    ;

CLOSE_PARENTHESIS
    :   ')'
    ;

WS : [ \t\r\n]+ -> skip ;

r   :   ans = expr
    {
        System.out.println($ans.result);
    }
	|	r r EOF
    ;

// parser

expr returns [int result]
    : e = expr ADD t = term
    {
        $result = $e.result + $t.result;
    }

    | t = term
    {
        $result = $t.result;
    }
    ;

term returns [int result]
    : t = term MULTIPLY f = factor
    {
        $result = $t.result * $f.result;
    }

    | f = factor
    {
        $result = $f.result;
    }
    ;

factor returns [int result]
    : OPEN_PARENTHESIS expr CLOSE_PARENTHESIS
    {
        $result = $expr.result;
    }

    | n = INTEGER
    {
        $result = Integer.valueOf($n.text);
    }
    ;
