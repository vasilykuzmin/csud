#!/bin/bash

_csud_autocompletion()
{
    if [ $COMP_CWORD -le 1 ] 
    then
        COMPREPLY=($(compgen -W "install remove list all" "${COMP_WORDS[COMP_CWORD]}"))
    else
        case ${COMP_WORDS[1]} in
            'install')
                names=$(csud all | sed 's/\n//g')
                COMPREPLY=($(compgen -W "${names}" "${COMP_WORDS[COMP_CWORD]}"))
            ;;
            'remove')
                names=$(csud list | sed 's/\n//g')
                COMPREPLY=($(compgen -W "${names}" "${COMP_WORDS[COMP_CWORD]}"))
            ;;
        esac
    fi
}

complete -F _csud_autocompletion csud
