# Simplex Method Matlab Implementation

This is matlab implementation of the two-phase simplex method for better understanding of the algorithm.

### There are three modes for choosing pivots - to avoid degeneracy

* Smallest Index Rule (SIR): Blend's rule

* Largest Index Rule (LIR): Reverse of SIR

* Successive Ratio Rule (SRR): Lexicographic order

### Running the tests

```
$ matlab -r main
```
- #### You can change the file to import (in main.m)

```
t = importdata('./data/XXX.txt', ' ');
```

- #### You can choose mode 'SIR' by (in main.m)

```
mode = 'SIR';
```

- #### Data Format Example (stadard form)
![alt text](image/formula.png)
```
-5 -6 -1 -4 -5 0 0 0
20 2 1 1 1 1 0 0
10 1 0 2 1 0 1 0
5 1 1 1 0 0 0 1
```
