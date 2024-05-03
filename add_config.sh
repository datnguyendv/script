root=$1
pems=$2

if [ -d "$root/.ssh" ]; then
  echo "$root/.ssh existed."
else 
  echo "$folder not found."
  mkdir $root/.ssh
  echo "$root/.ssh created"
fi

if [ -e "$root/.ssh/config" ]; then
  echo "$root/.ssh/config existed."
else 
  echo "config file not found."
  cd $root/.ssh/
  touch config 
  echo "config file created."
fi

content="# translator
Host trans_prod_fe
HostName ec2-52-74-125-10.ap-southeast-1.compute.amazonaws.com
 User ubuntu
 IdentityFile $pems

Host trans_dev_fe
HostName ec2-18-142-126-224.ap-southeast-1.compute.amazonaws.com 
  User ubuntu 
  IdentityFile $pems

Host trans_stage_fe
  HostName ec2-54-254-182-114.ap-southeast-1.compute.amazonaws.com 
  User ubuntu 
  IdentityFile $pems" 

if [ $(grep -l $content $root/.ssh/config) ]; then
  echo "config script are existed."
else 
  echo "$content" >> $root/.ssh/config
  echo "config scripted are added."
fi

