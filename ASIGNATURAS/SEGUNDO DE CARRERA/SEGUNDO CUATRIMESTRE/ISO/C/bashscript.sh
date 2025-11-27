./abece
if [ $? -eq 0 ] ; then
  ./longFich
  if [ $? -eq 0 ] ; then
    echo -e "\nwell done"
    exit 0
  else
    echo -e "\nfailed"
    exit 1
  fi
else
  echo -e "\nfailed"
  exit 1
fi
