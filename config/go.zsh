# Go environment
if command -v go >/dev/null && [[ -r "${HOME}/go/bin" ]]; then
   GOPATH="${HOME}/go"
   # Both Debian and Homebrew's go installation have GOROOT set correctly
fi
