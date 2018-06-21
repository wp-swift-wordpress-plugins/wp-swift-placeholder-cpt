#!/bin/bash
source ~/bash-scripts/_settings.sh
clear
folder=''
default_text_domain='wp-taoglas'
default_prefix='wp_taoglas'
while true
do
	# printf 'Enter your post type slug: '
	printf "Enter your post type ${PURPLE}slug${NC}: "
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
	printf "${PURPLE}Slug plural${NC}"
	read -p " ("$cpt"s): " plural_cpt

	# printf 'Enter your slug plural: (${cpt}s)'
	# read plural_cpt

	# Set default if not input
	if [ "${plural_cpt}" == "" ] ; then
	  plural_cpt=${cpt}s
	fi	

	# Check for valid characters a-z, A-Z, 0-9, -
	if [[ "$cpt" =~ [^a-z_] ]]; then
		echo ${red}"Invalid characters${NC}"
	else
		
		break
	fi	
done
#
temp_singular_label="$(tr '[:lower:]' '[:upper:]' <<< ${cpt:0:1})${cpt:1}"	
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
# temp_plural_label=${temp_singular_label}s
temp_plural_label="$(tr '[:lower:]' '[:upper:]' <<< ${plural_cpt:0:1})${plural_cpt:1}"
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

#
while true
do
	printf "${PURPLE}Text Domain${NC}"
	read -p " ($default_text_domain): " text_domain

	# Set default if not input
	if [ "${text_domain}" == "" ] ; then
	  text_domain=$default_text_domain
	fi	

	# Check for valid characters a-z, A-Z, 0-9, -
	if [[ "$cpt" =~ [^a-z-] ]]; then
		echo ${red}"Invalid characters${NC}"
	else
		# function_text_domain=${text_domain//-/_}
		# echo $function_text_domain
		# exit
		break
	fi	
done
#
default_prefix=${text_domain//-/_} 
while true
do
	printf "${PURPLE}Prefix${NC}"
	read -p " ($default_prefix): " prefix

	# Set default if not input
	if [ "${prefix}" == "" ] ; then
	  prefix=$default_prefix
	fi	

	# Check for valid characters a-z, A-Z, 0-9, -
	if [[ "$cpt" =~ [^a-z-] ]]; then
		echo ${red}"Invalid characters${NC}"
	else
		# function_text_domain=
		# echo $function_text_domain
		# exit
		break
	fi	
done
#
#
temp_folder=${text_domain}-${cpt}-cpt
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
clear
echo "Does this look ok?"
echo
printf "${PURPLE}cpt${NC} " 
echo $cpt
printf "${PURPLE}CPT${NC} " 
echo $CPT
printf "${PURPLE}plural_cpt${NC} " 
echo $plural_cpt
printf "${PURPLE}plural_label${NC} " 
echo $plural_label
printf "${PURPLE}singular_label${NC} " 
echo $singular_label
printf "${PURPLE}folder${NC} " 
echo $folder
printf "${PURPLE}text_domain${NC} " 
echo $text_domain
printf "${PURPLE}prefix${NC} " 
echo $prefix
echo
printf "${GREEN}${bold}Confirm? ${normal}${NC}[y/N] "
read verfiy

# Check result
if [[ $verfiy =~ ^[Yy]$ ]]
then
	echo "Renaming files..."

mv wp-text-domain-placeholder.php ${prefix}-${cpt}.php
mv assets/sass/wp-text-domain-placeholder-public.scss assets/sass/${prefix}-${cpt}-public.scss
mv assets/js/wp-text-domain-placeholder-public.js assets/js/${prefix}-${cpt}-public.js
	exit
	# rm -rf .git
	# git init
	# 
	sed -i "s/Placeholders/${temp_plural_label}/g" README.md
	#
	mv wp-text-domain-placeholder.php ${text_domain}-${cpt}.php	
else
    echo "Aborted"
    exit
fi