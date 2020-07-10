#!/bin/bash
# Parameters
rg_name=$1
storage_name=$2
container_name=$3
user_name=$4

file_path=/home/$4/$5
blob_storage=$5
storage_key=$6

# upload files to blob
upload_files(){
    az storage blob upload --account-name $2 --account-key $6 --container-name $3 --file /home/$4/$5 --name $5
}
upload_files >> /home/azureadmin/asif/storage_logs.txt

