# Add this to your .bashrc
_complete_ghe ()
{
        COMPREPLY=()
        if [[ $COMP_CWORD -eq 1 ]]; then
          comp_arr=$(ls $GH_BASE_DIR/${GH_ENTERPRISE};\
            ls $GH_BASE_DIR/${GH_ENTERPRISE}/$GITHUB)
        elif [[ $COMP_CWORD -eq 2 ]]; then
          local user=${COMP_WORDS[COMP_CWORD-1]}
          comp_arr=$(ls $GH_BASE_DIR/${GH_ENTERPRISE}/$user)
        else
          return 0
        fi
        cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=( $(compgen -W "${comp_arr}" -- $cur))
        return 0
}
complete -F _complete_ghe ghe
