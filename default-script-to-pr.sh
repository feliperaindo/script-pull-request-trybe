#!/bin/bash

#VERY IMPORTANT!!!!!! => To use this script you have to install "github cli" to use "gh" commands, and have a gitbub personal token.

# --> To install "github cli", on linux, access official webpage with this link "https://github.com/cli/cli/blob/trunk/docs/install_linux.md" and follow tutorial instalation berofe continue.
# --> To install "github cli", on other plataform, access official webpage with this link "https://github.com/cli/cli" and follow tutorial instalation before continue.
# --> To create a github personal token access you github account webpage and folow this menu links: "settings" -> "developer settings" -> "personal access tokens" and create a token.

#REQUIRED! => change the text "personal token from github" for your personal github token
TOKEN='personal token from github';

#IMPORTANT!!! => TO EXECUTE this file as a script in your terminal, you need to run command "chmod u+x `local saved`/`file-name` in terminal to make this file executable.
# --> The reference `local saved` is the entire path of directory you saved this file.
# --> The reference `file-name` is the name you gave for this file (as default it name is `scritp-to-pr`). If you change it`s name or download it whit another name, use file actual name.

#IMPORTANT!!! => This script receive 3 (three) parameters as default, the 1º(first) parameter is a github main repository webpage URL. The 2º(second) and 3º(third) parameters are yours firsname and lastname, in this order. If you change parameters orders when execute this script it won`t work property.

#REQUIRED => CHANGE 'LOCAL' FOR A ENTIRE PATH DIRECTORY YOU CHOOSE. THIS DIRECTORY WILL BE USE TO STORAGE ALL REPOSITORIES YOU WILL CLONE USING THIS SCRIPT.
LOCAL_DIR='local directory you will choose';

#RECOMENDED!!! => Before use this script at the first time, read entire code to understand what even part of this code do, and make some changes required.
#___________________________________________________________________________________________________________________________________________

#This command create manipulate 1º(first) parameter (URL) as a string, to get essecial part of it for next commands.
urlCut=$(awk -F'.com/' '{print $2}' <<< "$1");

#This command check if github repository is a valid URL and if you have access to it.
getStatus=$(curl --write-out '%{http_code}' --silent --output /dev/null --request GET \
--url "https://api.github.com/repos/$urlCut" \
--header "Accept: application/vnd.github.v3+json" \
--header "Authorization: Bearer $TOKEN" \
--include);

counter=0;

until [[ $getStatus = 200 ]];
do
	((counter++));
	echo "Tentativa número: $counter. $1 não está vivo e seu status é: $getStatus";
	sleep 2;
	getStatus=$(curl --write-out '%{http_code}' --silent --output /dev/null --request GET \
	--url "https://api.github.com/repos/$urlCut" \
	--header "Accept: application/vnd.github.v3+json" \
	--header "Authorization: Bearer $TOKEN" \
	--include);

done;

echo "$1 está vivo e seu status é: $getStatus";
#The commands above check every 2(two) seconds if you have access to github repository webpage informed as parameter. This commands run in a loop until you have access to repository, and print in your terminal how many tries it did and webpage status in every try.

#Three next commands just manipulate first parameter (URL) to be used in another commands.
urlUser=$(awk -F'/' '{print $4}' <<< "$1");

urlDirectory=$(awk -F"$urlUser" '{print $2}' <<< "$1");

urlProjectName=$(awk -F'-b-' '{print $2}' <<< "$1");

#This command navigate to a local directory in your computer you informed before and clone remote repository inside it.
cd "$LOCAL_DIR" || exit;

#this command clone repository you choosed in your computer.
gh repo clone "$urlCut";

#this command navigate to inside directory cloned from github repository
cd "${LOCAL_DIR}${urlDirectory}" || exit;

#this command create new branch
git checkout -b "$2-$3-$urlProjectName";

#this command create an empty file.
touch fileText.txt;

#Three next commands update file changes in your local branch and send them to remote repository.
git add .;

git commit -m 'create file to open PR';

git push -u origin "$2-$3-$urlProjectName";

#This command manipulate a variable as a string.
prProjectName=${urlProjectName//"-"/" "};

#this command open pull request in gitHub repository
gh pr create -t "[ ${2^} ${3^} ] ${prProjectName^^}" -f;

#this command Delete created file to open pull request
rm fileText.txt;
