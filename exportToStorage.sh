#!/bin/bash
# Parameters
rg_name=storageblob
location=eastus
storage_name=p3io9o8
container_name=newcont

file_path=/home/azureadmin/wordpress.txt
blob_storage=wordpress.txt

# create RG 
create_rg() {
    az group create --name ${rg_name} --location ${location}
}
# create storage account in the RG
create_storageaccount(){
    az storage account create -n ${storage_name} -g ${rg_name} -l ${location} --sku Standard_LRS
}
# create a container in Storage account
create_container(){
    az storage container create --account-name ${storage_name} --name ${container_name} --auth-mode login
}
# upload files to blob
upload_files(){
    az storage blob upload --account-name ${storage_name} --account-key ${storage_key} --container-name ${container_name} --file ${file_path} --name ${blob_storage}
    # azcopy copy '${file_path}' 'https://${storage_name}.blob.core.windows.net/${container_name}/myTextFile.txt'
}

create_rg >> /home/azureadmin/asif/storage_logs.txt
create_storageaccount >> /home/azureadmin/asif/storage_logs.txt
create_container >> /home/azureadmin/asif/storage_logs.txt
storage_key=$(az storage account keys list -g ${rg_name} -n ${storage_name} | jq '.[0] | .value')
upload_files >> /home/azureadmin/asif/storage_logs.txt

# az storage blob upload --account-name po09oi --account-key t5HNr7gOd6JhcpTFbemYO+KE2TOLaBntFFsV1DFj5Fy2YOpsHQA+awmZ+6MVu9HOYzJw8kv+UEyp6uRX9J9x4g== --container-name newcont --file /home/azureadmin/storage.tar --name storage.tar
# sudo azcopy copy '/home/azureadmin/wordpress.txt' 'https://po09oi.blob.core.windows.net/newcont/myTextFile.txt'
# az storage account keys list -g testblobgroup -n newcont

# az storage account keys list -g testblobgroup -n po09oi | jq '.[0] | .value'
# jq '.[] | .value'

#  key=$(echo $json | jq -r .fileServerProfile.glusterVmName)

# [
#   {
#     "keyName": "key1",
#     "permissions": "Full",
#     "value": "t5HNr7gOd6JhcpTFbemYO+KE2TOLaBntFFsV1DFj5Fy2YOpsHQA+awmZ+6MVu9HOYzJw8kv+UEyp6uRX9J9x4g=="
#   },
#   {
#     "keyName": "key2",
#     "permissions": "Full",
#     "value": "EZAq7GqJH81Qs/kOut3DTEvMQehcuVT/NCZ3IUWTRAz/FEruMqg21tGNL2EfhIu5M3tP1Xzi+t9VNVkMpElHEg=="
#   }
# ]
