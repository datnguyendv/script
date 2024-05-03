path=$1/$2

if [ -d "$path" ]; then
  echo "$path does exist."
else 
  mkdir $path
  if [ -d "$path" ]; then
    echo "$path created." 
  fi
fi
