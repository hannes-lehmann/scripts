To merge two `.zsh_history` files while maintaining the correct order based on timestamps, you can follow these steps:

1. **Concatenate the files.**
2. **Sort the combined file by the timestamp.**

Here’s how you can do it:

### Detailed Steps

1. **Concatenate the history files:**

   Use `cat` to combine the files:

   ```sh
   cat history1.zsh history2.zsh > combined_history.zsh
   ```

2. **Sort by timestamp:**

   Use `sort` to order by the numerical timestamp. The `-k2,2n` option sorts based on the second field numerically, assuming the format `: timestamp:command`.

   ```sh
   sort -t ';' -k1,1n combined_history.zsh > sorted_history.zsh
   ```

3. **Replace your current `.zsh_history` (optional):**

   Move the sorted file to your home directory and rename it if you want it to replace your current `.zsh_history`.

   ```sh
   mv sorted_history.zsh ~/.zsh_history
   ```

### Example Commands Summary

1. **Combine history files:**
   ```sh
   cat history1.zsh history2.zsh > combined_history.zsh
   ```

2. **Sort by timestamp:**
   ```sh
   sort -t ';' -k1,1n combined_history.zsh > sorted_history.zsh
   ```

3. **Replace current `.zsh_history`:**
   ```sh
   mv sorted_history.zsh ~/.zsh_history
   ```

### Full Command Script

For ease, here’s a full script to combine and sort the `.zsh_history` files (see script.sh).


### Explanation of Commands

- `cat history1.zsh history2.zsh > combined_history.zsh`: Concatenates the two history files into one.
- `sort -t ';' -k1,1n combined_history.zsh > sorted_history.zsh`: Sorts the concatenated file based on the timestamp.
- `mv sorted_history.zsh ~/.zsh_history`: Replaces the current `.zsh_history` with the sorted file.

This method ensures the combined history file maintains a chronological order.