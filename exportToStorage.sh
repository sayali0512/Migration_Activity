#!/bin/bash
# Export the storage.tar file to  Azure blob storage account
rg_name=$1
storage_name=$2
container_name=$3
user_name=$4
file_path=/home/$4/$5
blob_storage=$5
storage_key=$6


create_container(){
 sudo azcopy make "https://abs5nw26r.blob.core.windows.net/migration?sv=2019-10-10&ss=bfqt&srt=c&sp=rwdlacupx&se=2020-07-30T12:56:55Z&st=2020-07-13T04:56:55Z&spr=https&sig=X%2FjxNTzddNWM5DQZJDFHJcE9303lsB%2BiBbySgdFt4LQ%3D"
}
# upload files to blob
upload_files(){
  sudo azcopy copy "/home/azureadmin/storage.tar" "https://abs5nw26r.blob.core.windows.net/migration?sv=2019-10-10&ss=bfqt&srt=c&sp=rwdlacupx&se=2020-07-30T12:56:55Z&st=2020-07-13T04:56:55Z&spr=https&sig=X%2FjxNTzddNWM5DQZJDFHJcE9303lsB%2BiBbySgdFt4LQ%3D"
  
  
}


create_container
upload_files >> /home/azureadmin/storage_logs.txt

