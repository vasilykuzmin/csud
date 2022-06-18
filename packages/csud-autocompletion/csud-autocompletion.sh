#!/bin/bash

_csud_autocompletion()
{
    if [ $COMP_CWORD -le 1 ] 
    then
        COMPREPLY=($(compgen -W "install remove list all" "${COMP_WORDS[COMP_CWORD]}"))
    else
        if [ ${COMP_WORDS[1]} == "install" ] || [ ${COMP_WORDS[1]} == "remove" ] 
        then
            names=$(csud all | sed 's/\n//g')
            COMPREPLY=($(compgen -W "${names}" "${COMP_WORDS[COMP_CWORD]}"))
        fi
    fi
}

complete -F _csud_autocompletion csud
