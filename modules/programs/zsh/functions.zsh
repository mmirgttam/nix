# Returns seconds on stdout. Confirms the target datetime on stderr.
till() {
  local target now
  if [[ -z $* ]]; then
    print -u2 'Usage: till <datetime> (e.g. till 10am, till +1 hour)'
    return 1
  fi
  target="$(gdate -d "$*" +%s)" || return
  now="$(gdate +%s)" || return
  LC_ALL=C gdate -d "@$target" '+%a, %b %-d, %Y at %-I:%M%P' >&2 || return
  echo $(( target - now ))
}

# Prevents the system from sleeping for the given number of seconds.
caff() {
  if command -v caffeinate >/dev/null 2>&1; then
    caffeinate -d -t "$1"
  else
    systemd-inhibit --what=sleep --why="caff" sleep "$1"
  fi
}
