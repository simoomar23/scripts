#!/bin/bash

echo "Usage: num.sh [OP] [ARGS]..."
echo
echo "num.sh applies an operation to each positive integer in a list of numbers given as arguments."
echo
echo "OP is the operation to apply and can be one of the following:"
echo "  - l or len (for length): display the number of digits in each number"
echo "  - m or mir (for mirror): display each number in reverse order (mirrored)"
echo "  - s or sum (for sum): display the sum of the digits in each number"
echo "  - b or bin (for binary): display each number (given in decimal) in binary"
echo "  - d or dec (for decimal): display each number (given in binary) in decimal"
echo "  - i or int (for interactive): start interactive input for selecting the operation to apply to the numbers"
echo
echo "ARGS is the list of positive integers to process."
echo
echo "Example usage:"
echo "  ./num.sh len 123 4"
echo "  ./num.sh mir 123 4 56"
echo "  ./num.sh s 123"
echo
echo "If you run num.sh without arguments, it will display an error message followed by the usage guide."

exit 0
