# Bank tech test
-------------
## To use

Navigate to the directory within the terminal.

```
#to install gems
bundle install
#to run files in IRB
bin/rails
#to run tests
rspec
```

## My approach

Planning and structure:

I started by writing simple user stories and listing the nouns and verbs associated in the plan.md. I then decided upon what classes to create, by thinking about how to divide up responsibilities. The resulting Account Interface, and Account classes emerged as a fairly neat separation between the public methods which users interacted with, and the background logic responsible for responding to actions of the user, which could mostly be encapsulated in private methods.

I chose to create just two classes  due to the fairly narrow scope of the task and limited types of responsibility.

The code folder structure is fairly simple - the classes each have a file within the lib folder, and the corresponding tests live in the spec folder.

I used the rubocop gem to check formatting and simplecov to keep track of test coverage.

Improvements:

Some of the responsibilities fo the classes changed as the code developed, and I didn't always update the plan as this happened. It would be helpful next time to revisit the plan more regularly and make it consistent with the code I'm planning to write, to make sure I'm actively thinking about and checking my decisions.

I'm not sure about having an instance variable for the output. Since it doesn't need to be accessed except at the point of creation it would seem better not to create an instance varaible. I did this since I couldn't easily see another way to test the output.


## Specification

### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
