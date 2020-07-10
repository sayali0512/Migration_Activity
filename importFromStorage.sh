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
    az storage blob download --account-name $2 --container-name $3 --name $5 --file /home/$4/$5 --account-key $6
}
download_content >> import.txt


