
# Print Statements and Line-Ending Behaviors

Python naturally assumes that a line of code ends at the end of the... well, the line. This seems intuitive, which means it can feel weird to learn that other languages don't do that. Other languages require you to manually mark the end of a line somewhere. It's sort of like using a period at the end of a sentence even if the next sentence starts a new paragraph.

Most languages either use Python's approach or use semi-colons to mark the end of lines. To demonstrate the differences, we'll also show the different languages' syntax for printing things. Here's a full chart:

## Python
```
print("Here's a line of code")  
print("Here's another one!")
```
By default, print() adds a line break to the end of the printed text.

## Java
```
System.out.println("Here's a line of code");  
System.out.println("Here's another one!");
```
Like Python's print(), Java's System.out.println() adds a line break after the printed text. System.out.print() will print some text without creating a new line afterward.

## C
```
printf("Here's a line of code");  
printf("Here's another one!");
```
In C, the printf() function does not add a line break after the printed text. To do that, you need to include "\\n" inside the printed text itself, e.g. printf("New line please!\\n").

## C++
```
std::cout << "Here's a line of code";  
std::cout << "Here's another one!";
```
Like C, C++'s cout will not add a new line after the printed text. To add one, we would need to write std:cout << "New Line please!\\n".

## C#
```
Console.WriteLine("Here's a line of code");  
Console.WriteLine("Here's another one!");
```
Like Java, C# also has a Console.Write() function that will write without starting a new line afterward.

## JavaScript
```
console.log("Here's a line of code")  
console.log("Here's another one!")
```
By default, console.log() adds a line break to the end of the printed text.

## VB.NET
```
Console.WriteLine("Here's a line of code")  
Console.WriteLine("Here's another one!")
```
C# and VB.NET use the same underlying library, so you'll find that oftentimes syntax like Console.WriteLine is shared between them.

## Matlab
```
fprintf("Here's a line of code);  
fprintf("Here's another one!");
```
Like C, Matlab's fprintf will not add a new line after the printed text. To add one, we would need to write fprintf("New Line please!\\n").

## Swift
```
print("Here's a line of code")  
print("Here's another one!")
```
By default, print() adds a line break to the end of the printed text.

## Ruby
```
puts "Here's a line of code"  
puts "Here's another one!"
```
By default, puts adds a line break to the end of the printed text.
---

All these languages use either semicolons or nothing. Scripting languages (Python, JavaScript) generally do not use a semi-colon to mark the ends of lines. Most compiled languages (Java, C, C++, C#) use semi-colons. There are exceptions, though; Swift and VB.NET are a compiled languages that do not use semi-colons, while MatLab is a scripting language that does.

Some languages automatically add a line break after each print statement (Python, Ruby, Swift, JavaScript), while others will not (C, C++, Matlab). Others have separate functions depending on whether you want to add a line break (Java, C#, VB.NET). Whether a print function adds a line break determines whether consecutive print statements will print to the same line or separate lines; if the print function adds a line break, the output will appear on separate lines. For example, in Python, this...
```
print("1")  
print("2")
```
...will print:
```
1  
2
```
In C, though, this...
```
printf("1");  
printf("2");
```
...will print:
```
12
```
# Comment Syntax

Most programming languages use double-slash marks (//) to identify comments, and also support multi-line comments between /\* and \*/. Python's comment syntax is in the minority.

## Python
```
#This is a comment in Python  
  
#This is a  
#multiline comment  
#in Python
```
Python has no special way of creating multi-line comments.

## Java
```
//This is a comment in Java  
  
/\*  
 \* This is a  
 \* multi-line comment  
 \* in Java  
 \*/
```
The asterisks at the beginning of each line inside the multi-line comment are customary, but not required. Java, C++, JavaScript, and C# use the same syntax.

## C
```
/\* This is a comment \*/  
  
/\* This is a  
 \* multiline comment  
 \* comment in C  
 \*/
```
The asterisks at the beginning of each line inside the multi-line comment are customary, but not required. C does not have a dedicated single-line comment syntax.

## C++
```
//This is a comment in C++  
  
/\*  
 \* This is a  
 \* multi-line comment  
 \* in C++  
 \*/
```
The asterisks at the beginning of each line inside the multi-line comment are customary, but not required. Java, C++, JavaScript, and C# use the same syntax.

## C#
```
//This is a comment in C#  
  
/\*  
 \* This is a  
 \* multi-line comment  
 \* in C#  
 \*/
```
The asterisks at the beginning of each line inside the multi-line comment are customary, but not required. Java, C++, JavaScript, and C# use the same syntax.

## JavaScript
```
//This is a comment in JavaScript  
  
/\*  
 \* This is a  
 \* multi-line comment  
 \* in JavaScript  
 \*/
```
The asterisks at the beginning of each line inside the multi-line comment are customary, but not required. Java, C++, JavaScript, and C# use the same syntax.

## VB.NET
```
'This is a comment in VB.NET  
  
'This is a  
'multiline comment  
'in Python
```
VB.NET has no special way of creating multi-line comments.

## Matlab
```
%This is a comment in Matlab  
  
%{  
This is a  
multiline comment  
in Matlab  
%}
```
## Swift


```  
///This is a comment in Swift  

/\*\*  
 This is a  
 multi-line comment  
 in Swift 
\*/

```
Swift differs in subtle ways from C++, C#, Java, and JavaScript: it uses three slashes for a single-line comment, two asterisks at the start of a multi-line comment, and does not by convention put asterisks at the start of lines inside a multi-line comment.

## Ruby

#This is a comment in Ruby  
  
```
\=begin  
This is a  
multiline comment  
in Ruby  
\=end
```

Ruby is weird.
