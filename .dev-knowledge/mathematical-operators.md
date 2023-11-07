
# Mathematical Operators

Most languages share the same mathematical operators: it's hard to get away from plus for addition, minus for subtraction, etc. There are some unique ones, though: floor division, modulus, and exponentiation may differ by language.

## Python 	
- `a // b`  #Floor Division
- `a ** b`  #Exponentiation, a to the b
- `a % b`   #Modulus

## Java 	
- `a / b`   // See notes
- `a % b`   // Modulus 	

Java has no floor division operator, but it does not automatically convert to floating point numbers either. If you divide two integers, it will round down like floor division. If either number is a decimal number, the result will be the real quotient. Java has no exponent operator: instead it would use Math.pow(a, b).

## C, C++, C# 	
- `a / b`   /* See notes */
- `a % b`   /* Modulus */ 	

C's (and its derivatives') floor division works like Java's: if the numbers are integers, it will perform floor division, but if not, it will return a decimal number. C has no exponent operator, and instead uses separate functions.

## JavaScript 	
- `a % b`   // Modulus 	

JavaScript has neither a floor division operator nor an exponent operator. It uses separate functions for both.

## VB.NET 	
- `a \ b`   'Floor division
- `a ^ b`   'Exponentiation, a to the b
- `a mod b` 'Modulus

VB.NET's operator for modulus is just the keyword mod.

## Matlab 	
- `a .^ b`  %Exponentiation, a to the b 	

Matlab has no dedicated operators for floor division and modulus; it uses functions instead.

## Swift 	
- `a % b`   ///Modulus 	

Swift has no dedicated exponentiation or floor division operator; it uses functions instead.

## Ruby 	
- `a / b`   #See notes
- `a ** b`  #Exponentiation, a to the b
- `a % b`   #Modulus 	

Ruby's division operator works like C and Java: if the numbers are integers it performs floor division, otherwise it performs regular division.

Most languages support self-assignment like in Python: `a += 5`, for example, will work in almost every language listed here. Some languages, like C++ and Java, also have a shorthand or adding or subtracting one: `a++` will add one to a (same as `a += 1`), and `a--` will subtract one from a (same as `a -= 1`).
