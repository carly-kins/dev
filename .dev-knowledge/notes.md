# Intro to Comp Sci:

## Ch. 3.1 -- Control Structures

*Conditional Statements:* Programming statements that control what code is executed based on certain conditions; usually of the form “if”, “else if”, and “else”.

*Loop:* A programming control structure that executes a segment of code multiple times.

*Function:* A segment of code that performs a specific task, sometimes taking some input and sometimes returning some output.

*Exception:* An error that a program might want to anticipate and catch instead of outright avoiding.

*Exception Handling:* A control structure that catches certain anticipated errors and reacts to them accordingly.

*Scope:* The portion of a program’s execution during which a variable can be seen and accessed.

# Intro to Comp Sci:

## Ch. 3.1 -- Control Structures

*Conditional Statements:* Programming statements that control what code is executed based on certain conditions; usually of the form “if”, “else if”, and “else”.

*Loop:* A programming control structure that executes a segment of code multiple times.

*Function:* A segment of code that performs a specific task, sometimes taking some input and sometimes returning some output.

*Exception:* An error that a program might want to anticipate and catch instead of outright avoiding.

*Exception Handling:* A control structure that catches certain anticipated errors and reacts to them accordingly.

*Scope:* The portion of a program’s execution during which a variable can be seen and accessed.

Scope differs between languages 

Why This Difference Exists

    JavaScript: Designed for web development, where functions often manipulate global states (like the DOM), so it was historically more permissive with global variables.

    Python: Designed to emphasize clarity and avoid unintended side effects. Python encourages local scoping to prevent accidental changes to global variables, making programs easier to debug and maintain.

Best Practice

In both languages, avoiding global variables where possible is a good habit. Instead of relying on global state, it's better to pass variables in and out of functions explicitly. This makes the code easier to understand and reduces bugs.

In Python, use return values to handle variables instead of relying on global state:

```python
def getWinner(team1, team2, score1, score2):
    if score1 > score2:
        return team1, team2
    elif score2 > score1:
        return team2, team1
    else:
        return None, None  # Handle tie case

winner, loser = getWinner("Georgia Tech", "Georgia", 28, 27)
print(f"The winner is {winner} and the loser is {loser}")
```
or 
```python
winner = ""

def getWinner(team1, team2, score1, score2):
    global winner  # Declare that we are modifying the global variable
    if score1 > score2:
        winner = team1
    elif score2 > score1:
        winner = team2

getWinner("Georgia Tech", "Georgia", 28, 27)
print(winner)  # Outputs: Georgia Tech
```
*Nested Conditional:* A conditional statement that is itself controlled by another conditional statement. More simply, an if-then statement within another if-then statement.