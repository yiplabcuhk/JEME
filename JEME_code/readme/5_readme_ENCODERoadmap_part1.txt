Step 1 of JEME for reconstructing the ENCODE+Roadmap enhancer-target networks can be performed by running the following scripts in the specified order:
./1_all_batch_generate.sh # Generate error terms for each 1MB intervals based on LASSO model
./2_cat.sh                # Concatenate all the 1MB intervals
./3_separate.sh           # Separate error terms for each of the 127 files
./4_sort.sh               # Sort the files
./5_batch_paste.sh        # Integrate the error terms for different features(DNase, H3K27ac, H3K27me3, H3K4me1)