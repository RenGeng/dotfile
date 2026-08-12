#!/usr/bin/env zsh
# ponytail: reads zsh history directly; upgrade to sqlite-backed store if picker gets slow
set -e
GCLOUD=/opt/homebrew/share/google-cloud-sdk/bin/gcloud
cmd=$(LC_ALL=C awk -F';' '/^: [0-9]+:[0-9]+;gcloud compute ssh/{sub(/^: [0-9]+:[0-9]+;/,""); print}' ~/.zsh_history \
  | awk '!seen[$0]++' \
  | tail -r \
  | fzf --prompt="gcloud ssh> " --height=80% --reverse) || exit 0
cmd=${cmd/#gcloud/$GCLOUD}
print -P "%F{cyan}\$ $cmd%f"
eval "$cmd"
