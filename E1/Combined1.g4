grammar Combined1;

/*
 * Parser Rules
 */
options {
    language=CSharp3;
	namespace=E1;
}

//@parser::
@header{
	using System;
	using System.Collections.Generic;
	using System.Linq;
	using System.Text;
	using System.Threading.Tasks;
	using E1;
	using Antlr4.Runtime;
	}
@members{
	static String input = "";
	static String pegaComandoPilha(IToken token){
		return token.Text;
	}
}


start: gramm EOF 
	 ;
gramm: e;

e: e OPERACOESAS t{
	input = pegaComandoPilha($OPERACOESAS);
	if(input == "+"){
		Console.WriteLine("add");
	}else if(input == "-"){
		Console.WriteLine("sub");
		}
} | t;
t: t OPERACOESMD f{
	input = pegaComandoPilha($OPERACOESMD);
	if(input == "*"){
		Console.WriteLine("mul");
	}else if(input == "/"){
		Console.WriteLine("div");
	}
}| f;
f: OPEN e CLOSE | ID {
Console.WriteLine("push " + pegaComandoPilha($ID));
}| OPERACOESAS ID {Console.WriteLine("push " + pegaComandoPilha($OPERACOESAS) + pegaComandoPilha($ID)); };


/*
 * Lexer Rules
 */

OPEN: '(';

CLOSE: ')';

ID: [0-9]+[.0-9]*;

OPERACOESMD: ('*' | '/');

OPERACOESAS: ('+' | '-');

SPACE: (' '| '\t' | '\n')+ -> skip;