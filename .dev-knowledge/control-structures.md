
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