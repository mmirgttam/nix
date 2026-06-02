# Returns the number of seconds until the given natural language datetime string.
till() {
  target="$(gdate -d "$*" +%s)" || return
  echo $(( target - $(date +%s) ))
}

# Prevents the system from sleeping for the given number of seconds.
caff() {
  if command -v caffeinate >/dev/null 2>&1; then
    caffeinate -i -t "$1"
  else
    systemd-inhibit --what=sleep --why="caff" sleep "$1"
  fi
}
