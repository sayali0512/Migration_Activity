#!/bin/bash

 storage_name=$1
 vm_name=$2
 container_name=$3/$8/$2
 user_name=$4
 file_path=/home/$4/$5
 blob_storage=$5
 SAS_token=$6
 storage_dir_path=$7  #/home/azureadmin/storage
 source_dns_name=$8   #lb-5nw26r.eastus.cloudapp.azure.com
 wp_path=$9   # /azlamp/html
 wp_data_path=${10}    # /azlamp/data

copysitetostorage(){
sudo mkdir $storage_dir_path
sudo mkdir $storage_dir_path/site
sudo cp -rf $wp_path/$source_dns_name/ $storage_dir_path/site
}

copydatatostorage(){
sudo mkdir $storage_dir_path/data
sudo cp -rf $wp_data_path/$source_dns_name $storage_dir_path/data
}
createstoragetar(){
tar cf $storage_dir_path.tar $storage_dir_path/
}

# upload files to blob
upload_files(){
az storage blob upload --account-name $storage_name --container-name $container_name --file /home/$user_name/$blob_storage --name $blob_storage --sas-token "$SAS_token"

}

copysitetostorage >> /tmp/storage_logs.txt
copydatatostorage >> /tmp/storage_logs.txt
createstoragezip >> /tmp/storage_logs.txt
upload_files >> /tmp/storage_logs.txt