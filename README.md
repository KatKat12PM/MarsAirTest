# MarsAirTest

## Implementation

The overall project structure is shown below:
````
+ testcases
    the set of test cases(BDD)
+ keywords
    the set of commands
+ resources-pages
    Elements path
+ resources-env
    env configurations and variables
````

## Running the project

To run the project you'll need to install robot framework and yaml

## Statement for running the MarsAir’s robot framework

````
- for run all test cases files
robot -v env:${env} testcases

- for run only expected files
robot -v env:${env} testcases/${expexcted file}.robot

example:
robot -v env:prod testcases
robot -v env:prod testcases/applyPromotionalCode.robot

````