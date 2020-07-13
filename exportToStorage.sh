#!/bin/bash
# Export the storage.tar file to  Azure blob storage account
storage_name=$1
lb_name=$2
vm_name=$3
container_name=$4
user_name=$5
file_path=/home/$5/$7
blob_storage=$7
SAS_token=$8



# upload files to blob
upload_files(){
az storage blob upload --account-name $storage_name --container-name $container_name/$2/$3 --file /home/$5/$7 --name $7 --sas-token "$8" --auth-mode login

}


upload_files >> /home/azureadmin/storage_logs.txt
