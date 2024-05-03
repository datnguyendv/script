path=$(eval echo ~$USER)
directory="pems"
pems_file=$1
dest_folder=$path/$directory

./create_folder.sh $path $directory

./moving_file.sh $path $dest_folder $pems_file

./add_config.sh $path $dest_folder/$pems_file

echo "add config successful."
