cat smash.py
import os
import git
import fnmatch
import sys

def is_binary_file(file_path):
    with open(file_path, 'rb') as f:
        s = f.read(1024)
        if b'\0' in s:
            return True
    return False

def process_repo(repo_path):
    # Initialize the Git repository
    # repo = git.Repo(repo_path)

    # Get the .gitignore file content
    with open(os.path.join(repo_path, '.gitignore'), 'r') as f:
        gitignore_content = f.read()

    # Split the .gitignore content into a list of ignored patterns
    gitignore_patterns = [line.strip() for line in gitignore_content.splitlines() if line.strip()]

    # Walk through the repository directory
    files = []
    for root, dirs, fs in os.walk(repo_path):
        for file in fs:
            # Skip hidden files and directories
            if file.startswith('.'):
                continue

            # Get the full path of the file
            file_path = os.path.join(root, file)

            # Check if the file is ignored by .gitignore
            ignore_file = False
            for pattern in gitignore_patterns:
                if fnmatch.fnmatch(file_path, pattern):
                    ignore_file = True
                    break

            if not ignore_file and not is_binary_file(file_path):
                files.append(file_path)

    # Create the output file
    output_file_name = repo_path.replace('/', '_') + '.txt'
    with open(output_file_name, 'w') as f:
        for file in files:
            try:
                with open(file, 'r', encoding='utf-8', errors='replace') as file_content:
                    f.write(f"CONTENT FOR FILE '{file}':\n")
                    f.write(file_content.read())
                    f.write("\n")
                    f.write("\n")
                    f.write(f"END OF CONTENT FOR '{file}':\n")
                    f.write("###################################################\n")
            except UnicodeDecodeError:
                f.write(f"{file}: (binary file, cannot display contents)\n\n")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <repo_path>")
        sys.exit(1)

    repo_path = sys.argv[1]
    process_repo(repo_path)%                                                                                                                                                                                            