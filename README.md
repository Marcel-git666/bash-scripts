# Bash System Utilities

This repository contains a collection of useful bash scripts for system administration and diagnostics.

## Scripts

### system_health_check.sh

A system diagnostic tool that checks the status of critical services and logs the results.

**Features:**
- Checks status of essential system services (ssh, cron)
- Colorized output for easy identification of issues
- Logs all diagnostics to timestamped log files

**Usage:**
```bash
./system_health_check.sh
```

**Output:**
- Console output with color-coded status indicators
- Log file created at `log/system_diagnostic/YYYYMMDD_HHMM_health_check.txt`

### linux_readme_downloader.sh

A utility script that downloads the Linux kernel README file and provides viewing options.

**Features:**
- Downloads the Linux kernel README from GitHub
- Checks if the file already exists before downloading
- Allows viewing specific portions of the file (beginning or end)

**Usage:**
```bash
./linux_readme_downloader.sh
```

**Interactive prompts:**
- Asks if you want to update an existing file
- Asks if you want to view the file after download
- Allows you to specify how many lines to view (positive number for beginning, negative for end)

## Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/bash-scripts.git
   cd bash-scripts
   ```

2. Make the scripts executable:
   ```bash
   chmod +x system_health_check.sh linux_readme_downloader.sh
   ```

3. Run any script:
   ```bash
   ./system_health_check.sh
   # or
   ./linux_readme_downloader.sh
   ```

## Notes

- Log files and downloaded text files are excluded from git using `.gitignore`
- The scripts use ANSI color codes for improved readability
