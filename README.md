Backend Evaluation Project
============

Print to standard output (STDOUT) numbers from 1 to 100. 

For multiples of 5, the output should be Nama. 
For multiples of 7, the output should be Team and for multiples of 35, the output should be Nama Team.

Examples
--------

    input:
      1
    output:
      1

    input:
      5
    output:
      1, 2, 3, 4, Nama  

    input:
      7
    output:
      1, 2, 3, 4, Nama, 6, Team
      
    input:
      100
    output:
      1, 2, 3, 4, Nama, 6, Team, 8, 9, Nama, 11, 12, 13, Team, Nama, 16, 17, 18, 19, Nama, Team, 22, 23, 24, Nama, 26, 27, Team, 29, Nama, 31, 32, 33, 34, Nama Team, 36, 37, 38, 39, Nama, 41, Team, 43, 44, Nama, 46, 47, 48, Team, Nama, 51, 52, 53, 54, Nama, Team, 57, 58, 59, Nama, 61, 62, Team, 64, Nama, 66, 67, 68, 69, Nama Team, 71, 72, 73, 74, Nama, 76, Team, 78, 79, Nama, 81, 82, 83, Team, Nama, 86, 87, 88, 89, Nama, Team, 92, 93, 94, Nama, 96, 97, Team, 99, Nama    


Usage
-----

To run the tests you need to do the following:

1. Ensure you are using a compatible ruby version (>= 2.3.0)
2. `bundle install`
3. `rspec`
