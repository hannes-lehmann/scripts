# smash.py

## Description

The `smash.py` script is designed to process a given Git repository, extract the contents of all non-binary, non-ignored files, and compile them into a single output text file. This tool can be useful for creating a comprehensive snapshot of the textual content of a repository.

## Features

- **Initialization**: Sets up the script to read and process files from a specified Git repository path.
- **.gitignore Handling**: Reads and parses the `.gitignore` file to identify patterns of files and directories that should be excluded from processing.
- **File Filtering**: Traverses the repository directory, filtering out hidden files and directories, and checks each file against `.gitignore` patterns.
- **Binary File Detection**: Skips binary files to focus on text files only.
- **Output Compilation**: Gathers the content of each relevant file and writes it into a single output file, appending markers to denote the start and end of each file's content.

## How It Works

1. **Initialize Git Repository**:
   - The script is set up to initialize a Git repository object, but this part is currently commented out and not used.

2. **Read .gitignore**:
   - The `.gitignore` file in the repository's root is read and its contents are split into a list of ignore patterns.

3. **Traverse Repository**:
   - The script walks through all directories and files within the repository.
   - Hidden files and directories are skipped.

4. **Check Against .gitignore**:
   - Each file's path is checked against the patterns defined in `.gitignore`.
   - Files matching any pattern are ignored.

5. **Binary File Check**:
   - Files are checked to determine if they are binary. This is done by reading the first 1024 bytes and looking for null bytes (`\0`).

6. **Compile Text Content**:
   - For each non-binary, non-ignored file, its content is read and written to an output text file.
   - The output file is named based on the repository path, replacing slashes with underscores.

7. **Error Handling**:
   - If a file cannot be decoded as UTF-8, it is noted in the output file as a binary file.

## Usage

```bash
python smash.py <repo_path>
```

- **Arguments**:
  - `<repo_path>`: The path to the Git repository you want to process.

## Example

```bash
python smash.py /path/to/my/repo
```

This command will generate an output text file named `path_to_my_repo.txt` in the same directory as the script, containing the textual contents of all relevant files from the specified repository.

## Notes

- Ensure the repository path provided is correct and accessible.
- The output file will be created in the current working directory of the script.

