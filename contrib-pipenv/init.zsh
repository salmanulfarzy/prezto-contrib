#
# Activate PipEnv on directory
#
# Authors:
#   Salmanul Farzy <salmanulfarzy@gmail.com>
#

# Return if requirements are not found.
if (( ! ${+commands[pipenv]} )); then
  return 1
fi

# Activate PipEnv on directory
function _pipenv_cd {
  local _pwd="${PWD:A}"

  if [[ -n $PIPENV_PIPFILE || -f $_pwd/Pipfile ]]; then
    command pipenv shell &> /dev/null
  fi
  # TODO: Exit PipEnv on moving outside of project root
}

# TODO: Allow option to toggle from preztorc
# if zstyle -t ':prezto:module:pipenv' auto-switch 'yes'; then
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _pipenv_cd
# fi

# Enable completion for 'pipenv'.
