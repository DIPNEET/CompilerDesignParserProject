%{
	#include "y.tab.h"
%}

%%
byte|short|int|long|float|double|bool|char  return DATA_TYPE;

void                                        return VOID_TYPE;

inline                                      return INLINE;

alignas|and|atomic_cancel|auto|catch|char32_t|concept|const_cast|co_return|default  return RESERVED_WORD;
enum|extern|for|if|mutable|noexcept|nullptr|or_eq|public|requires|signed|switch     return RESERVED_WORD;
static_assert|this|typeid|unsigned|while|alignof|and_eq|atomic_commit|bitand|char   return RESERVED_WORD;
break|const|class|continue|co_yield|delete|dynamic_cast|explicit|false|friend|try   return RESERVED_WORD;
import|namespace|not|operator|private|register|return|sizeof|static_cast|using      return RESERVED_WORD;
synchronized|thread_local|typename|volatile|xor|and|asm|atomic_noexcept|bitor       return RESERVED_WORD;
case|char16_t|compl|constexpr|co_await|decltype|do|else|export|float|goto           return RESERVED_WORD;
module|new|not_eq|or|protected|reinterpret_cast|short|static|struct|template        return RESERVED_WORD;
throw|typedef|union|virtual|wchar_t|xor_eq                                          return RESERVED_WORD;


\&                                          return REFERENCE;
\*                                          return POINTER;
[A-Za-z_][A-Za-z0-9_]*                      return IDENTIFIER;
[ \t]                                       ;
\(                                          return OPENING_BRACE;
\)                                          return CLOSING_BRACE;
\,                                          return COMMA;
\{                                          return OPENING_CURLY_BRACE;
\}                                          return CLOSING_CURLY_BRACE;
.                                           return CONTENT;
\n                                          return NEWLINE;
%%

int yywrap()
{
	return 1;
}
