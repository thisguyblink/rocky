#!/bin/bash

languageIndex=0
langaugeCount=0

availableLanguages=("Ada" "C" "C#" "C++" "Go" "Java" "Javascript" "PHP" "Perl" "Python" "R" "Rust" "Visual Basic")
selectedLanguages=("false" "false" "false" "false" "false" "false" "false" "false" "false" "false" "false" "false" "false")

printf "Welcome to \e[31mR \e[33mO \e[32mC \e[36mK \e[34mY \e[0m\n"
printf "Choose Languages for the Project\n"
printf "Press Space or Enter to select, arrows to move, Y to confirm\n"

for language in "${availableLanguages[@]}"; do
  printf "\e[90m○ %s\e[0m\n" "$language"
done

printf "\e[13A"

while true; do
  read -r -s -n 1 -d ' ' key
 
  # arrow keys send escape + [ + A/B/C/D, read the rest
  if [[ "$key" == $'\x1b' ]]; then
    read -r -s -n 2 key2
    key="$key$key2"
  fi

  if [[ "$key" == $'\r' || "$key" == $'\n' || "$key" == "y" ]]; then
    remainingLines=$(( 13 - languageIndex ))
    printf "\e[${remainingLines}B"
    break

  elif [[ "$key" == "" && "${selectedLanguages[$languageIndex]}" == "true" ]]; then
    selectedLanguages[$languageIndex]="false"
    printf "\e[2K\r\e[90m○ %s\e[0m\n" "${availableLanguages[$languageIndex]}"
    printf "\e[1A"
    (( langaugeCount-- ))
    
  elif [[ "$key" == "" && "${selectedLanguages[$languageIndex]}" == "false" ]]; then
    selectedLanguages[$languageIndex]="true"
    printf "\r\e[32m● %s\e[0m\n" "${availableLanguages[$languageIndex]}"
    printf "\e[1A"
    (( langaugeCount++ ))

  elif [[ "$key" == $'\x1b[A' && $languageIndex -gt 0 ]]; then
    (( languageIndex-- ))
    printf "\e[1A"

  elif [[ "$key" == $'\x1b[B' && $languageIndex -lt 12 ]]; then
    (( languageIndex++ ))
    printf "\e[1B"
  fi

done

if [[ langaugeCount -lt 2 ]]; then
  printf "You are not using enough languages :(\n"
  printf "Please rerun the setup or uninstall this! Have a good day :)\n"
  printf "Computer will self destruct in 10...\n"
fi 

printf "Selected Languages: " 
for index in range {0..12}; do
  if [[ "${selectedLanguages[$index]}" == "true" ]]; then 
    printf "%s, " "${availableLanguages[$index]}"
  else
    availableLanguages[$index]="none"
  fi 
done

printf "\e[2D  "
printf "\n"


  
