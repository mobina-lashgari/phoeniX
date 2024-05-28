Computer Organization - Spring 2024 - IUST
==============================================================
## Assembly Assignment 1

- Student Name : Mohammadreza Piri Sangdeh
- Team Members: Mobina Lashgari - Sara Dadashi
- Student ID: 99411218
- Date: 2024/05/24

## Part One

### Quicksort

#### Introduction
Quicksort is a highly efficient sorting technique that divides a large data array into smaller ones. A vast array is divided into two arrays, one containing values smaller than the provided value, say pivot, on which the partition is based. The other contains values greater than the pivot value.

The program consists of 5 main sections :
1. **Initialization**: Defining the SP (stack pointer), loading initial values, and preparing the array example to be sorted.
2. **Execution**: Calling the `QUICKSORT` function and then exiting the program.
3. **Quicksort Function**
4. **Partition Function**: A helper function used to partition the array.
5. **Exit**: Loading the sorted array into registers and halting the program.

#### Detailed Explanation

1. **Initialization**:
    - The stack pointer is adjusted and Registers `a0` to `a5` are initialized with sample values. Then an array is loaded into memory at address `a0`, with values `[5, 4, 8, 6, 1]`. The start (`a1`) and end (`a2`) indices of the array are set to `0` and `4`, respectively.

    ```assembly
    addi sp, sp, 1000
    li a0, 0
    li s10, -1
    li s11, 5
    ...
    li a1, 0 # start_number
    li a2, 4 # end_number
    ```

2. **Main Execution**:
    - The `QUICKSORT` function is called to sort the array. Then program jumps to the `EXIT` label to terminate.

    ```assembly
    jal ra, QUICKSORT
    jal ra, EXIT
    ```

3. **Quicksort Function**:
    - The function first saves registers and initializes local variables. Then the base condition for recursion is checked : if the start index is greater than or equal to the end index, the function returns.
    - The `PARTITION` function is called to partition the array and the `QUICKSORT` function is recursively called on the left and right sub-arrays.

    ```assembly
    QUICKSORT:
    addi sp, sp, -20
    ...
    jal ra, PARTITION
    ...
    jal ra, QUICKSORT  # quicksort(arr, start, pi - 1);
    ...
    jal ra, QUICKSORT  # quicksort(arr, pi + 1, end);
    ```

4. **Partition Function**:
    - This function partitions the array around a pivot element. It places elements smaller than the pivot to its left and larger elements to its right. The function uses a loop to swap elements as needed to maintain the partitioning.

    ```assembly
    PARTITION:
    addi sp, sp, -4
    ...
    lw t0, 0(t0)     # pivot = arr[end]
    ...
    LOOP:
    BEQ t2, a2, LOOP_DONE   # while (j < end)
    ...
    SWAP:
    ...
    ```

5. **Exit**:
    - The sorted array is loaded into registers `x21` to `x25`. The program halts with an `ebreak` instruction.

    ```assembly
    EXIT:
    lw x21,0(a0)
    lw x22,4(a0)
    lw x23,8(a0)
    lw x24,12(a0)
    lw x25,16(a0)
    ebreak
    ```
Here is the Waveform of the code :

![1000018533](https://github.com/MMDPiri/phoeniX_MohPir_99411218/assets/169598509/b433a5e4-3837-4c48-9031-07cde02755df)


## Part Two

### Square Root

#### Introduction
In mathematics, a square root function is defined as a one-to-one function that takes a non-negative number as an input and returns the square root of the given input number.
The integer square root of a number \( n \) is the largest integer \( x \) such that \( x^2 \leq n \).

#### Detailed Description

The algorithm implemented is a simple iterative method to find the integer square root. It works by incrementing a counter and checking its square against the input number until the square exceeds the input number. The counter is then decremented to provide the correct integer square root.

#### Assembly Code

The provided RISC-V assembly code for calculating the integer square root is as follows:

```assembly
li a0, 22    # a = 22
li t0, 0     # j = counter = 0

LOOP:
mul t1, t0, t0      # i = j*j
bgt t1, a0, DONE    # if i>a
addi t0, t0, 1      # j=j+1
beq x0, x0, LOOP    # back to the LOOP
DONE:
addi t0, t0, -1     # Final answer
ebreak
```

### Explanation

1. **Initialization**:
    - `li a0, 13`: Loads the input integer 22 into the register `a0`. Number 22 is the sample integar which we intend to calculate the square root of.
    - `li t0, 0`: Initialize register `t0` to 0 which is used as our counter.

2. **Loop** :
    - `mul t1, t0, t0`: Calculate the square of `t0` and store it in `t1`.
    - `bgt t1, a0, DONE`: If the square (`t1`) is greater than the input number (`a0`), jump to the `DONE` label.
    - `addi t0, t0, 1`: Increment the counter (`t0`) by 1.
    - `beq x0, x0, LOOP`: Jump back to the `LOOP` label to repeat the process.

3. **Completion**:
    - `addi t0, t0, -1`: Decrement the counter (`t0`) by 1.
    - `ebreak`: End the program execution.

##### Example

For the given code, the input number is 22. The integer square root of 22 is 4, since \( 4^2 = 16 \) and \( 5^2 = 25 \) which exceeds 22.

![1000018534](https://github.com/MMDPiri/phoeniX_MohPir_99411218/assets/169598509/48c8fc20-0b5c-4e51-9a24-57ddd6bfd69b)


