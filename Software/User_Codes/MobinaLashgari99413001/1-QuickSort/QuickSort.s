addi sp, sp, 1000
li a0, 0
li s10, -1
li s11, 5

#init arr[] to memory
li	a5, 5
sw	a5, 0(a0)
li	a5, 4
sw	a5, 4(a0)
li	a5, 8
sw	a5, 8(a0)
li	a5, 6
sw	a5, 12(a0)
li	a5, 1
sw	a5, 16(a0)

li a1, 0 # start_number
li a2, 4 # end_number

jal ra, QUICKSORT
jal ra, EXIT

QUICKSORT:
addi sp, sp, -20
sw ra, 16(sp)
sw s3, 12(sp)
sw s2, 8(sp)
sw s1, 4(sp)
sw s0, 0(sp)

addi s0, a0, 0
addi s1, a1, 0
addi s2, a2, 0
BLE a2, a1, START_GT_END
BEQ a2, s10, START_GT_END
BEQ a1, s11, START_GT_END

jal ra, PARTITION

srli s3, a5, 2

addi a0, s0, 0
addi a1, s1, 0
addi a2, s3, -1
jal ra, QUICKSORT  # quicksort(arr, start, pi - 1);

addi a0, s0, 0
addi a1, s3, 1
addi a2, s2, 0
jal ra, QUICKSORT  # quicksort(arr, pi + 1, end);

START_GT_END:

lw s0, 0(sp)
lw s1, 4(sp)
lw s2, 8(sp)
lw s3, 12(sp)
lw ra, 16(sp)
addi sp, sp, 20
jalr x0, ra, 0

PARTITION:
addi sp, sp, -4
sw ra, 0(sp)

slli t0, a2, 2   # end * sizeof(int)
add t0, t0, a0
addi a5, t0, 0   # a5 = &pivot  
lw t0, 0(t0)     # pivot = arr[end]

addi t2, a1, 0   # j = start
LOOP:
BEQ t2, a2, LOOP_DONE   # while (j < end)

slli t3, t2, 2   # j * sizeof(int)
add a6, t3, a0   # (arr + j)
lw t3, 0(a6)     # arr[j]

BGT t0, t3, PIVOT_GT_CURR_ELEMENT  # if (pivot > arr[j])
BLT a5, a6, BACK_TO_LOOP           # if (&pivot < &arr[j])

SWAP:
addi a7, a5, 0   # temp = &pivot
addi a5, a6, 0
addi a6, a7, 0
sw t0, 0(a5)
sw t3, 0(a6)     # swap(&pivot, &arr[j])
beq x0,x0, BACK_TO_LOOP

PIVOT_GT_CURR_ELEMENT:
BLT a5, a6, SWAP # if(&pivot < &arr[j])
BACK_TO_LOOP:
addi t2, t2, 1   # j++
beq x0, x0, LOOP

LOOP_DONE:
lw ra, 0(sp)
addi sp, sp, 4
jalr x0, ra, 0

EXIT:
lw	x21,0(a0)
lw	x22,4(a0)
lw	x23,8(a0)
lw	x24,12(a0)
lw	x25,16(a0)
ebreak