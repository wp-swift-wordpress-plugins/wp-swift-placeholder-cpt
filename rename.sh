#!/bin/bash
source ~/bash-scripts/_settings.sh
clear
folder=''
default_prefix='wp-taoglas'
while true
do
	printf 'Enter your post type slug: '
	read cpt

	# Check for valid characters a-z, A-Z, 0-9, -
	if [[ "$cpt" =~ [^a-z_] ]]; then
		echo ${red}"Invalid characters${NC}"
	else
		CPT=$(tr '[:lower:]' '[:upper:]' <<< "$cpt")
		break
	fi	
done
#
while true
do
	printf "${PURPLE}Prefix${NC}"
	read -p " (wp-taoglas): " prefix

	# Set default if not input
	if [ "${prefix}" == "" ] ; then
	  prefix=$default_prefix
	fi	

	# Check for valid characters a-z, A-Z, 0-9, -
	if [[ "$cpt" =~ [^a-z-] ]]; then
		echo ${red}"Invalid characters${NC}"
	else
		break
	fi	
done
#
temp_folder=${prefix}-${cpt}-cpt
#
while true
do
		
	printf "${PURPLE}Folder${NC}"
	read -p " ("$temp_folder"): " folder

	# Set default if not input
	if [ "${folder}" == "" ] ; then
	  folder=$temp_folder
	fi	
	
	# Check if folder alreadt exists
	if [ -d "$folder" ]; then
		echo "${RED}This folder $folder already exists${NC}"
	else	
		break
	fi
done
#
temp_singular_label="$(tr '[:lower:]' '[:upper:]' <<< ${cpt:0:1})${cpt:1}"	
temp_plural_label=${temp_singular_label}s
#
# Do a loop until we have a valid plural label
while true
do
	printf "${PURPLE}Plural Label${NC}"
	read -p " (${temp_plural_label}): " plural_label
	# Set default if not input
	if [ "${plural_label}" == "" ] ; then
	  plural_label=$temp_plural_label
	fi	

	# Check for valid characters a-z, A-Z, 0-9, -
	if [[ "$cpt" =~ [^a-z] ]]; then
		echo ${red}"Invalid characters${NC}"
	else
		break	
	fi	
done
#
# Do a loop until we have a valid singular label
while true
do
	printf "${PURPLE}Singular Label${NC}"
	read -p " (${temp_singular_label}): " singular_label
	# Set default if not input
	if [ "${singular_label}" == "" ] ; then
	  singular_label=$temp_singular_label
	fi	

	# Check for valid characters a-z, A-Z, 0-9, -
	if [[ "$cpt" =~ [^a-z] ]]; then
		echo ${red}"Invalid characters${NC}"
	else
		break	
	fi	
done
echo "(cpt)" $cpt
echo "(CPT)" $CPT
echo "(folder)" $folder
echo "(plural_label)" $plural_label
echo "(singular_label)" $singular_label


rm -rf .git
git init
