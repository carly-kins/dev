# Relational Operators

Most relational operators are the same in all languages. These are the same in Python, Java, C, C++, C#, JavaScript, VB.NET, Matlab, Swift, and Ruby:

- `a < b`: Less than
- `a <= b`: Less than or equal 
- `a == b`: Equal to
- `a >= b`: Greater than or equal to
- `a > b`: Greater than

If a and b are not the same type, JavaScript will automatically try to convert them to the same type before comparison. To avoid this conversion, you'd use `===`.

The languages differ a little bit more with the 'not equal to' operator:

## Python, Java, C, C++, C# 

`a != b `

## JavaScript 	

`a != b ` 	

If a and b are not the same type, JavaScript will automatically try to convert them to the same type before comparison. To avoid this conversion, you'd use `!==`.

## VB.NET 	

`a <> b` 	

Technically, the `<>` operator works in most other languages as well for 'not equal to', but `!=` is more common.
Matlab 	`a ~= b` 	

# Boolean Operators

The three boolean operators--and, or, not--are generally represented in one of three ways: with symbols, with double-symbols, or with plaintext words. Different languages also use slightly different capitalizations for booleans, so we'll use the language-appropriate ones here, too.

## Python 	
- `True and False`  #And
- `True or False`   #Or
- `not True`        #Not 	

You can also use & (for and) and | (for or) in Python, but they technically do something slightly different. They perform bitwise operations, which we don't cover in this course.

## Java 	
- `true && false`   #And
- `true || false`   #Or
- `!true`           #Not
- `true ^ false`    #Exclusive-Or 	

You can also use single-operators (& or | instead of && or ||), but it's generally better to use double operators. Double operators only evaluate later conditions if they might change the end result. Java also offers an exclusive-or operator, which is True if exactly one of the two conditions is True, not both or neither.

## C 	
- `1 && 0`   #And
- `1 || 0`   #Or
- `!1`       #Not 	

C does not natively have boolean types: it treats 0 as False and 1 (or any non-zero number) as True.

## C++, C# 	
- `true && false`   #And
- `true || false`   #Or
- `!true`           #Not 	

C++ and C# are the same as C, but includes true boolean types like Java.

## JavaScript 	
- `true && false`   #And
- `true || false`   #Or
- `!true`           #Not 	

## VB.NET 	
- `True And False`  #And
- `True Or False`   #Or
- `Not True`        #Not
- `True Xor False`  #Exclusive-Or 	

Following its style, VB.NET capitalizes both the boolean values and the logical operators. It also offers an exclusive-or operator. It also includes two additional operators, AndAlso and OrElse, which function like && and || in Java. For more, see our later interlude on short-circuiting.

## Matlab 	
- `TRUE And FALSE`  #And
- `TRUE Or FALSE`   #Or
- `Not TRUE`        #Not
- `TRUE xor FALSE`  #Exclusive-Or 	

Matlab also offers an exclusive or operator.

## Swift 	
- `true && false`   #And
- `true || false`   #Or
- `!true`           #Not 	

## Ruby 	
- `true and false`  #And
- `true && false`   #Also And
- `true or false`   #Or
- `true || false`   #Also Or
- `not true`        #Not
- `!true`           #Also Not 	

Ruby lets you use either symbols or words.