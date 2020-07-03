#!/bin/bash
# Parameters
rg_name=storageblob
storage_name=p3io9o8
container_name=newcont
file_path=/home/azureadmin/asif/wordpress.txt
blob_storage=wordpress.txt
storage_key=$(az storage account keys list -g ${rg_name} -n ${storage_name} | jq '.[0] | .value')
download_content()
{
    az storage blob download --account-name ${storage_name} --container-name {container_name} --name ${blob_storage} --file ${file_path} --account-key ${storage_key}
}
download_content >> import.txt