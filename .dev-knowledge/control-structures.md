
# Indicating Control Structures

Most languages use brackets -- { and } -- to indicate the scope of a control structure. The lines inside the control structure are typically indented for readability, but it would be possible to remove all indentation and still have working code in these languages.

We'll use conditionals here to show the indentation of control structures.chart:

## Python
```
if True:
    #Some code would go here!
#The control structure is over when the indentation ends.
```

## Java, C, C++, C#, JavaScript, Swift
```
if (true) { /* An open bracket starts the control structure. */
    /* Some code would go here! */
} /* A close bracket ends the control structure. */
```
You will find vicious arguments online over whether the open bracket should go alongside the control structure or on the next line. Personally, I prefer the same-line structure.

## VB.NET
```
If True Then
    'Some code would go here!
End If 'The VB.NET keyword End If ends the control structure
```
VB.NET does not require an additional character or keyword to start a control structure, but does require one to end a structure. It infers the control structure starts when it sees a control structure keyword like `If`, and then it formally declares the control structure over with something like `End If`.

## Matlab
```
if true
    %Some code would go here!
end %The keyword end ends the control structure.
```
Like VB.NET, Matlab has a formal keyword reserved for ending control structures: `end`.

## Ruby
```
if true
    #Some code would go here!
end #The keyword end ends the control structure.
```
Like VB.NET, Ruby has a formal keyword reserved for ending control structures: `end`.

# If, Else If, and Else

## Python
```
if some_bool:
    #Some code would go here!
elif some_other_bool:
    #Some other code would go here!
else:
    #Some other code would go here!
```

## Java, C, C++, C#, JavaScrip
```
if (some_bool) {
    /* Some code would go here! */
} else if (some_other_bool) {
    /* Some other code would go here! */
} else {
    /* Some other code would go here! */
}
```
You'll also find lots of arguments online about whether the closing bracket should go on the same line as the else if and the else. I prefer to keep the brackets on the same line; we can always add extra blank lines if we want to for readability. Note that in these languages, the condition itself must go inside parentheses.

## VB.NET
```
If some_bool Then
    'Some code would go here!
ElseIf some_other_bool Then
    'Some other code would go here!
Else
    'Some other code would go here!
End If
```
VB.NET capitalizes its conditional keywords `(If, ElseIf, Else, and End If)`, and it also has an optional keyword `Then` that makes the code read a little more like natural language. It reads quite nicely if we use boolean names like today_is_monday. It also ends a conditional with the dedicated keyword `End If` instead of a close bracket.

## Matlab
```
if some_bool
    %Some code would go here!
elseif some_other_bool
    %Some other code would go here!
else
    %Some other code would go here!
end
```
Like VB.NET, Matlab has a formal keyword reserved for ending control structures: `end`.

## Swift
```
if some_bool {
    /* Some code would go here! */
} else if some_other_bool {
    /* Some other code would go here! */
} else {
    /* Some other code would go here! */
}
```
Swift is identical to Java and C except that it does not require parentheses around the conditional expression. `end`.

## Ruby
```
if some_bool
    #Some code would go here!
elseif some_other_bool
    #Some other code would go here!
else
    #Some other code would go here!
end
```
Ruby is identical to Matlab, which is weird.