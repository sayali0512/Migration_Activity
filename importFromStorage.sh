#!/bin/bash
# Parameters


storage_name=$1
lb_name=$2
vm_name=$3
container_name=$4/$lb_name/$vm_name
user_name=$5
file_path=/home/$5/$6
blob_storage=$6
SAS_token=$7

download_content()
{
    az storage blob download --account-name $storage_name --container-name $container_name --name $blob_storage --file /home/$user_name/$blob_storage --sas-token "$SAS_token"
}
download_content >> /home/$user_name/logimport.txt


