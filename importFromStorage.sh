#!/bin/bash
# Parameters
rg_name=$1
storage_name=$2
container_name=$3
user_name=$4
file_path=/home/$4/$5
blob_storage=$5
storage_key=$6
download_content()
{
    az storage blob download --account-name $storage_name --container-name $container_name --name $blob_storage --file /home/$user_name/$blob_storage --account-key $storage_key
}
download_content >> /home/$user_name/logimport.txt


