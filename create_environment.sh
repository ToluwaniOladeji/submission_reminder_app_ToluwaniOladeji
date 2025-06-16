
#!/usr/bin/bash

echo "This script creates the necessary directories and subdirectories"
echo "What is your Firstname: "
read name
root_dir=submission_reminder_$name
mkdir $root_dir
##
##
##
##
##
#create the app directory and populate with the reminder.sh script
mkdir -p $root_dir/app/
touch $root_dir/app/reminder.sh
chmod +x $root_dir/app/reminder.sh
##
##
##
##
#populating the reminder.sh script
{
	echo '#!/bin/bash'
	echo ''
	echo '# Source environment variables and helper functions'
	echo 'source ./config/config.env'
	echo 'source ./modules/functions.sh'
	echo ''
	echo '# Path to the submissions file'
	echo 'submissions_file="./assets/submissions.txt"'
	echo ''
	echo '# Print remaining time and run the reminder function'
	echo 'echo "Assignment: $ASSIGNMENT"'
	echo 'echo "Days remaining to submit: $DAYS_REMAINING days"'
	echo 'echo "--------------------------------------------"'

	echo 'check_submissions $submissions_file'
} >> $root_dir/app/reminder.sh
##
##
##
##
#create the modules directory and populate with the functions.sh script and make it executable
mkdir -p $root_dir/modules/
touch $root_dir/modules/functions.sh
chmod +x $root_dir/modules/functions.sh

{
	echo '#!/bin/bash'
	echo ''
	echo '# Function to read submissions file and output students who have not submitted'
	echo 'function check_submissions {'
		echo 'echo 'local submissions_file=$''
		echo 'echo "Checking submissions in $submissions_file"'
		echo '# Skip the header and iterate through the lines'
		echo 'while IFS=, read -r student assignment status; do'
			echo '# Remove leading and trailing whitespace'
			echo 'student=$(echo "$student" | xargs)'
			echo 'assignment=$(echo "$assignment" | xargs)'
			echo 'status=$(echo "$status" | xargs)'
			echo '# Check if assignment matches and the status is 'not submitted''
			echo 'if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then'
				echo 'echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"'
			echo 'fi'
			echo 'done < <(tail -n +2 "$submissions_file") # Skip the header'
	echo '}'
} >> $root_dir/modules/functions.sh

#create the assets dir and populate with the submissions.txt file
mkdir -p $root_dir/assets/
touch $root_dir/assets/submissions.txt
#populating the submission.txt file

{
	echo "student, assignment, submission status"
	echo "Toluwani Oladeji, Shell Navigation, not submitted"
	echo "Benita Ramos, Git, submitted"
	echo "Sola Magodo, Shell Navigation, not submitted"
	echo "Johnson Benson, Shell Basics, submitted"
	echo "Mayowa Jimoh, Git, Submitted"
	echo "Ojay Attah, Shell Basics, not submitted"
	echo "Wale Agba, Shell Navigation, not submitted"
	echo "Segun Williams, Git, not submitted"
	echo "Paul Shelby, Shell Navigation, not submitted"
	echo "Bola Aare, Git, not submitted"
	echo "Seun Kuti, Shell Basics, not submitted"
	echo "Paula Dickson, Shell Navigation, not submitted"
	echo "Miracle Briggs, Git, not submitted"
	echo "Dozie Frank, Shell Basics, not submitted"
} >> $root_dir/assets/submissions.txt
##
##
#creates the config dir and adds the config.env file 
mkdir -p $root_dir/config/
touch $root_dir/config/config.env

#populating the config.env file

{
	echo '# This is the config file'
	echo 'ASSIGNMENT="Shell Navigation"'
	echo 'DAYS_REMAINING=2'
} >> $root_dir/config/config.env


#create the startup.sh file and make it executable
touch $root_dir/startup.sh
chmod +x $root_dir/startup.sh

#populating the startup.sh script file 

{
	echo '#!/usr/bin/bash'
	echo 'source ./config/config.env'
	echo 'source ./modules/functions.sh'
	echo './app/reminder.sh'
} >> $root_dir/startup.sh

echo "Environment created successfully"
