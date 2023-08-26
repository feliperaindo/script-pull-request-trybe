#!/bin/bash

# !! FOLLOW INSTRUCTIONS BELOW !!

#VERY IMPORTANT!!!!!! => To use this script you have to install "github cli" to use "gh" commands, and have a github personal token.

# --> To install "github cli", on linux, access official webpage with this link "https://github.com/cli/cli/blob/trunk/docs/install_linux.md" and follow tutorial installation before continuing.
# --> To install "github cli", on another platform, access official webpage with this link "https://github.com/cli/cli and follow tutorial installation before continuing.
# --> To create a github personal token access your github account webpage and folow this menu links: "settings" -> "developer settings" -> "personal access tokens" and "create a token".
 
#REQUIRED! => substitute the text "personal token from github" for your personal github token. DO NOT REMOVE QUOTATION MARKS, JUST SUBSTITUTE THE TEXT INSIDE.
TOKEN="personal token from github";

#REQUIRED => CHANGE 'local directory you will choose' FOR A ENTIRE PATH DIRECTORY YOU CHOOSE. THIS DIRECTORY WILL BE USE TO STORAGE ALL REPOSITORIES YOU WILL CLONE USING THIS SCRIPT. DO NOT REMOVE QUOTATION MARKS, JUST SUBSTITUTE THE TEXT INSIDE.
LOCAL_DIR="local directory you will choose";

#REQUIRED => CHANGE 'inform your team' FOR THE LETTER OF YOUR TEAM. DO NOT REMOVE QUOTATION MARKS, JUST SUBSTITUTE THE TEXT INSIDE.
TEAM="inform your team";

#REQUIRED!!! => TO EXECUTE this file as a script in your terminal, you need to run command "chmod u+x `local saved`/`file-name`" in terminal to make this file executable.
# --> The reference `local saved` is the entire path of directory you saved this file.
# --> The reference `file-name` is the name you have for this file (as default it name is `script-to-pr`). If you change it`s name or download it with another name, use file actual name.

#REQUIRED!!! => This script receive 3 (three) parameters as default, the 1º(first) parameter is a github main repository webpage URL. The 2º(second) and 3º(third) parameters are yours firstname and lastname, in this order. If you change parameters orders when execute this script it won`t work property.

#RECOMENDED!!! => Before use this script at the first time, read entire code to understand what even part of this code do, and make some changes if you need or want.

#___________________________________________________________________________________________________________________________________________

#Parameters
URL=$1;
FIRST_NAME=$2;
LAST_NAME=$3;

#Four next commands just manipulate 1º(first) parameter (URL) to be used in another commands.
urlCut=$(awk -F'.com/' '{print $2}' <<< "$URL");

urlUser=$(awk -F'/' '{print $4}' <<< "$URL");

urlDirectory=$(awk -F"$urlUser" '{print $2}' <<< "$URL");

urlProjectName=$(awk -F"-$TEAM-" '{print $2}' <<< "$URL");

#This function check if github repository is a valid URL and if you have access to it.
counter=0;

checkUrlStatus() {
	getStatus=$(curl -w '%{http_code}' -s -o /dev/null -X GET \
	--url "https://api.github.com/repos/$urlCut" \
	--header "Accept: application/vnd.github.v3+json" \
	--header "Authorization: Bearer $TOKEN" \
	--include);

	if [[ $getStatus -eq 200 ]]
	  then
	  	echo "$URL está vivo e seu status é: $getStatus";
	else
			((counter++));
		  echo "Tentativa número: $counter. $URL não está vivo e seu status é: $getStatus";
		  sleep 2;
		  checkUrlStatus;
  fi
	#The commands above check every 2(two) seconds if you have access to github repository webpage informed as parameter. This commands run in a loop until you have access to repository, and print in your terminal how many times loop tries access and webpage status every try.
}

#This function clone github repository, create a new branch and send it to remote repository.
cloneRepository() {
	#Navigate to a local directory you informed before.
	cd "$LOCAL_DIR" || exit;

	#Clone repository you choose in your computer.
	gh repo clone "$urlCut";

	#Navigate to inside directory cloned from github repository.
	cd "${LOCAL_DIR}${urlDirectory}" || exit;

	#Create new branch.
	git checkout -b "$FIRST_NAME-$LAST_NAME-$urlProjectName";

	#Create an empty file.
	touch fileText.txt;

	#Two next commands update file changes in your local branch.
	git add .;

	git commit -m 'create file to open PR';
}

counterError=0;

syncRemoteBranch() {
	catchOutput=$(git push -u origin "$FIRST_NAME-$LAST_NAME-$urlProjectName" 2>&1);
	
	echo "$catchOutput";
	
	captureError=$(echo "$catchOutput" | grep -i error | awk -F':' '{print $1}');
	
	if [[ $captureError = 'ERROR' ]];
		then
			((counterError++));
			echo "Tentativa número: $counterError.";
			sleep 2;
			syncRemoteBranch;
	fi
	#check every 2(two) seconds if new branch was sent to remote repository. This commands run in a loop until operation has successfully result, and print in your terminal how many times loop tries it and operation status every try.
}


#This function create a Pull Request.
createPullRequest() {
	#Set space as the delimiter
	IFS='-';

	#Read the split words into an array based on space delimiter
	read -ra arrayNames <<< "$urlProjectName";

	#Concatenate each value of the array by using the loop
	for eachName in "${arrayNames[@]}"
	do
  		prProjectName+="${eachName^} ";
	done;

	#Open pull request in gitHub repository
	gh pr create -a "@me" -t "[ ${FIRST_NAME^} ${LAST_NAME^} ] ${prProjectName}" -f;

	#Delete empty file created to open pull request
	rm fileText.txt;
}

checkUrlStatus;
cloneRepository;
syncRemoteBranch;
createPullRequest;

#Developed by: Felipe de Carvalho Raindo - turma 26 - tribo "B"