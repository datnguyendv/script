root=$1
path=$2
file=$3
path_file_root=$1/$3

if [ -f "$path/$file" ]; then
  echo "$file existed."
  chmod 400 $path/$file
  stat -L -c "%a" $path/$file
else 
  echo "$file not existed in destination folder."
  if [ -f "$path_file_root" ]; then
    echo "$file existed in root."
    chmod 400 $path_file_root
    mv $path_file_root $path/$file
    echo "$file moved."
    echo "$file permission $(stat -L -c "%a" $path/$file)"
  else
    exit
  fi
fi
