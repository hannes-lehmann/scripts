To move your Chromium profiles from macOS to a new PC running Ubuntu, follow these steps:

### 1. Locate Chromium Profile on macOS:

1. **Find the Profile Directory**:
   - Chromium profiles on macOS are stored in `~/Library/Application Support/Chromium`.
   - Each profile is in a subdirectory under this path, usually named `Default`, `Profile 1`, `Profile 2`, etc.

2. **Copy the Profile Directory**:
   - You can use Finder or Terminal to copy the directory.

   **Using Finder**:
   - Open Finder.
   - Press `Cmd + Shift + G` and enter `~/Library/Application Support/Chromium`.
   - Copy the entire `Chromium` directory to an external drive or a network location accessible from your Ubuntu PC.

   **Using Terminal**:
   - Open Terminal and run:
     ```bash
     cp -r ~/Library/Application\ Support/Chromium /path/to/external/drive
     ```
     Replace `/path/to/external/drive` with the actual path to your external drive.

### 2. Transfer the Profile Directory to Ubuntu:

#### Step-by-Step Process:

##### 1. **Prepare Chromium Profiles on macOS**

1. **Close Chromium**:
   - Ensure Chromium is completely closed to avoid file locks.

2. **Copy the Profile Directory with Correct Permissions**:
   - Use `rsync` to preserve file permissions and avoid issues with open files.
   - Open Terminal and execute:
     ```bash
     rsync -avh ~/Library/Application\ Support/Chromium /path/to/external/drive
     ```
   - This command synchronizes the directory, preserving permissions and attributes.

##### 2. **Transfer Profiles to Ubuntu**

1. **Mount External Drive on Ubuntu**:
   - Connect your external drive. It should automatically mount under `/media/yourusername/`.

2. **Copy Profiles to the Correct Location**:
   - Use `rsync` again to ensure correct permissions and avoid issues.
   - Open Terminal and run:
     ```bash
     rsync -avh /media/yourusername/externaldrive/Chromium ~/.config/
     ```
   - Replace `/media/yourusername/externaldrive/Chromium` with the actual path to your Chromium data on the external drive.

##### 3. **Adjust Permissions on Ubuntu**

1. **Ensure Correct Ownership**:
   - Change ownership of the files to your user.
   - Run:
     ```bash
     sudo chown -R yourusername:yourusername ~/.config/chromium
     ```
   - Replace `yourusername` with your actual Ubuntu username.

2. **Verify File Permissions**:
   - Ensure that files are readable and writable by your user.
   - Run:
     ```bash
     find ~/.config/chromium -type d -exec chmod 755 {} \;
     find ~/.config/chromium -type f -exec chmod 644 {} \;
     ```

##### 4. **Launch Chromium and Verify**

1. **Open Chromium**:
   - Start Chromium and check if it loads the profiles correctly.

2. **Check for Profile Integrity**:
   - Navigate through your profiles, bookmarks, extensions, and settings to ensure everything is working as expected.

### Troubleshooting Tips:

- **Profile Corruption**: If Chromium fails to start or profiles seem corrupted, you might need to delete the `Local State` file located in `~/.config/chromium` and then retry launching Chromium.
- **Permissions**: Double-check that the `.config/chromium` directory and its contents are owned by your user and have the correct permissions.
- **Backup**: Always keep a backup of your profiles in case you need to retry the process.


