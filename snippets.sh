#!/usr/bin/env bash
# 

declare -A MYSNIPPETS
SNIPFILE="/home/raph/Code/langageBash/rofi-modi-snippets/mysnippets"
SEPARATORCHAR='_'

# loading snippets from file into array
while read line
do
  key=`echo $line | cut -d $SEPARATORCHAR -f 1`
  value=`echo $line | cut -d $SEPARATORCHAR -f 2`
  MYSNIPPETS["$key"]="$value"
done < $SNIPFILE

if [ -z "$@" ]
then
    echo -en "\x00prompt\x1fSnippet\n"
    echo -en "\0markup-rows\x1ftrue\n"
    echo -en "\0message\x1fSnippets starting by <i>cmd</i> are eval'd\n"

    for K in "${!MYSNIPPETS[@]}";
    do
        echo $K
    done
    echo "quit"
else
  snippet=$@
  if [ $snippet = "quit" ]
  then
      exit 0
  fi
  if [ ${MYSNIPPETS[$snippet]+_} ]
  then
    if [[ $snippet = cmd* ]]
    then
      x=`eval ${MYSNIPPETS[$snippet]}`
      coproc (echo -n "$x" | xdotool type --clearmodifiers --file -)
    else
      coproc (echo -n ${MYSNIPPETS[$snippet]} | xdotool type --clearmodifiers --file -)
    fi
  fi
fi
