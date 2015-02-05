#!/usr/bin/env sh
#
# # Koding Package Manager Installer
#
# The following script is a shorthand script, used as a frontend
# for the actual installer (located in ./installer). This script
# is **not** run by KPM at all.
#

main()
{
ubuntu_required_msg()
{
  echo ""
  echo "KPM currently depends on Ubuntu, and only runs on Koding VMs."
  echo "Please retry this on a standard Ubuntu Koding VM."
  echo ""
  exit 1
}

OS=$(lsb_release -si)
if [ "$?" -ne "0" ]; then
  ubuntu_required_msg
elif [ "$OS" != "Ubuntu" ]; then
  ubuntu_required_msg
fi

which fish > /dev/null
if [ "$?" -ne "0" ]; then
  echo ""
  echo "Error: Fish not found"
  echo ""
  echo "The Fish shell is currently required by KPM to run properly."
  echo "Please install Fish with the following command, and retry this"
  echo "installer:"
  echo ""
  echo "    \$ sudo apt-get install fish"
  echo ""
  exit 1
fi

curl -sSL https://raw.githubusercontent.com/koding/kpm-scripts/master/kpm/installer | fish
exit $?
}
main
