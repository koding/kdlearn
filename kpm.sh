#!/usr/bin/env sh
#
# # Koding Package Manager Installer
#
# The following script is a shorthand script, used as a frontend
# for the actual installer (located in ./os/kpm/install). This script
# is **not** run by KPM at all.
#
main()
{
# ## Get the platform
platform=`uname | tr '[:upper:]' '[:lower:]'`
os=""
case "$platform" in
  darwin)
    os="osx"
    ;;
  linux)
    # The only supported linux distro currently
    os="ubuntu"
    ;;
  windows)
    os="$platform"
    ;;
  *)
    cat << EOF
Error 84: Unknown platform.
EOF
  exit 84
  ;;
esac


branch='master'
if [ "$KPM_DEVELOP" = "true" ]; then
  branch='develop'
fi


# ## Pipe the actual installer
curl -sSL "https://raw.githubusercontent.com/koding/kpm-scripts/$branch/$os/kpm/install" | bash
exit $?
}
main
