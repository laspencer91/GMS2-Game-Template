/// @description Poll For Inputs

// This object can be used to calculate Input States that can the be used by any other
// object without having to re-poll for inputs. Also it keeps your project nice and tidy!
// Single Responsibility Principle
horizontalInput = keyboard_check(rightKey) - keyboard_check(leftKey);
verticalInput   = keyboard_check(downKey)  - keyboard_check(upKey);