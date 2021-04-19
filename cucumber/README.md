# Requirements:

 1. Place the Json folder in the QF-Test Jython folder.
 2. Place cucumber folder in the QF-Test Plugin Folder. 
    See the manual for details regarding the path to folder.
 3. Restart QF-Test.

# How does it work:

 The proceure executeGherkinScript parses the "featureFile" and "procedureDefinitionFile". 
 
## Feature file

### Feature: Division
In order to avoid errors the teller must be able to divide numbers

  Example: foobar

  Scenario: Regular numbers
    Given that I have entered the Number 3 in the calculator
    And I have pressed the "Division" Key
    And I have entered the Number 2 in the Calculator
    When I press the "Equal" Key
    Then on the screen should be displayed the Result 1,5



### Feature: Good old Hello World

  Some feature description
  That is multi line
  to see what is happening

  Scenario: Someone starts their day
    Given a person
    When that person wakes up
    Then that person says "Hello, World!

###  procedureDefinitionFile

<pre>
actions.enter	given,and	^I have entered the Number (\d+) in the calculator$	number:1
actions.press	given,and,when	^I press the "([^\"]+)" Key$	key:1
actions.check	then	^on the screen should be displayed the result (\d+,\d+)$	result:1
</pre>

With the help of procedureDefinitionFile QF-Test looks for the required Procedures in the Test-suite. Et volià. 
This represents the Cucumber stlye of Tests and uses the Gherkin parser (see <https://docs.cucumber.io/installation/>), 
in our case instead of annotating the PRocedures(which maybe will come in the future) we map them in a separate file.

#### The procedureDefinitionFile is TAB delimited. 

- First columtn - Name of the QF-Test Procedure which should get called 
- Second column - (case-insensitive), CSV keywords, 
- Third column - regular expression used to *match* the feature-steps 
- Fourth column - which group in the regular expression to which variable from the procedure should be mapped

##### Examples for 4-th column:

- a:1,b:2,c:4 the first group in the Regex will use the paramter 'a', the second group the paramter 'b' and the
third 'c' 
When using "=" instead of ":" this is not used in the Regex, but in the procedure call: 
- x=Hello,y=World calls the procedure always with the paramters x=Hello und y=World.