#!/bin/bash
# Export the storage.tar file to  Azure blob storage account
storage_name=$1
lb_name=$2
vm_name=$3
container_name=$4
user_name=$5
file_path=/home/$5/$6
blob_storage=$6
SAS_token=$7



# upload files to blob
upload_files(){
az storage blob upload --account-name $storage_name --container-name $container_name/$lb_name/$vm_name --file /home/$user_name/$blob_storage --name $blob_storage --sas-token "$SAS_token" --auth-mode login

}


upload_files >> /home/azureadmin/storage_logs.txt
