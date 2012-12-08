# Data Types
## general number
* avoid literal numbers (except 0 and 1)
* anticipate divide-by-0
* no implicite conversion
* avoid mixed-type comparison (like 1.6 == 1)

## integer
* check integer division
* check integer overflow (+ - * /)
* check overflow in intermediate results

## float
* Avoid additions and subtractions on numbers that have greatly different magnitudes 
* avoid == operation
* anticipate rounding errors

## chars & string
* avoid liter string
* watch for overflow index
* unicode
