Step 1 of JEME for reconstructing the FANTOM5 enhancer-target networks can be performed by running the following scripts in the specified order:
./1_all_batch_generate.sh # Generate error terms for each 1MB intervals based on LASSO model
./2_cat.sh                # Concatenate all the 1MB intervals
./3_separate.sh           # Separate error terms for each of the 808 files
./4_sort.sh               # Sort the files