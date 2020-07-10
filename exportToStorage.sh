#!/bin/bash
# Export the storage.tar file to  Azure blob storage account
rg_name=$1
storage_name=$2
container_name=$3
user_name=$4
file_path=/home/$4/$5
blob_storage=$5
storage_key=$6

# upload files to blob
upload_files(){
    az storage blob upload --account-name $storage_name --account-key $6 --container-name $container_name --file /home/$user_name/$blob_storage --name $blob_storage
}
upload_files >> /home/azureadmin/storage_logs.txt

