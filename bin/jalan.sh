binding="localhost"

if [ $# -gt 0 ]; then
  binding=$1
fi

rails s -b "ssl://${binding}:3000?key=localhost.key&cert=localhost.cert"
