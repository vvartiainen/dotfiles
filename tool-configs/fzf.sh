#!/bin/bash

fssh() {
  eval "$(alias | rg -o 'kitten ssh.*[^'\'']' | fzf --height ~100%)"
}

faws() {
  eval "export AWS_PROFILE=$(echo "$AWS_PROFILES" | fzf --height ~100%)"
}

alias fssh=fssh
alias faws=faws
