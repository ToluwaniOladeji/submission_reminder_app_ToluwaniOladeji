# Submission Reminder App

This project is a shell-based reminder application that notifies students who have not submitted their assignments. It uses a set of organized scripts and configuration files to operate.

## How it Works

1. You run a setup script (`create_environment.sh`) that generates a working directory structure with all necessary scripts and files.
2. The app checks a file (`submissions.txt`) containing student submission records.
3. It filters and prints out students who have not submitted a specified assignment.
4. A second script (`copilot_shell_script.sh`) allows you to change the assignment being tracked and re-run the reminder.

## Getting Started

### 1. Run the Setup Script

Use this command in your terminal:

```bash
bash create_environment.sh
```

You will be prompted to enter your name. The script will create a directory named:

```
submission_reminder_YourName
```

This directory contains:

- `app/reminder.sh` – Main logic for sending reminders
- `modules/functions.sh` – Function to check student submissions
- `config/config.env` – Stores the current assignment being tracked
- `assets/submissions.txt` – CSV file with submission data
- `startup.sh` – Script to start the reminder app

### 2. Run the Reminder App

Navigate into your generated directory and run:

```bash
bash startup.sh
```

This will check the `submissions.txt` file for students who have not submitted the assignment specified in `config.env`.

### 3. Change Assignment

To change the assignment being tracked, run:

```bash
bash copilot_shell_script.sh
```

This script will:
- Prompt for a new assignment name
- Update the `ASSIGNMENT` value in `config/config.env`
- Run the reminder again automatically

## File Structure

After running the setup, your directory will look like this:

```
submission_reminder_YourName/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── config/
│   └── config.env
├── assets/
│   └── submissions.txt
└── startup.sh
```

## Notes

- Only students with status `not submitted` will be listed.
- Make sure `submissions.txt` follows the format:

```
student, assignment, submission status
Alice, Shell Navigation, not submitted
Bob, Git, submitted
```

## Repository Structure

Your GitHub repository should contain:

- create_environment.sh
- copilot_shell_script.sh
- README.md
