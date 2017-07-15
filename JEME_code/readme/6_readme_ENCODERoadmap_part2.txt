Step 2 of JEME for reconstructing the ENCODE+Roadmap enhancer-target networks can be performed by running the following scripts in the specified order:
./1_join_active.sh   # Only retain the pairs involving the enhancers that are active in each sample
./2_join_window.sh   # Add the sample-specific features of windows for the pairs in each sample
./3_join_enhancer.sh # Add the sample-specific features of enhancers for the pairs in each sample 
./4_join_promoter.sh # Add the sample-specific features of promoters for the pairs in each sample
./5_head.sh          # Add a header
./6_arff.sh          # Transform to .arff format
./7_batch_apply.sh   # Apply the model
./8_result.sh        # Get the predicting results for each pair
./9_pos.sh           # Set the cutoff and get positive pairs (in the directory predictions/)