#!/bin/bash
# Parameters


storage_name=$1
vm_name=$2
container_name=$3/$7/$2
user_name=$4
file_path=/home/$4/$5
blob_storage=$5
SAS_token=$6
source_dns_name=$7   #lb-5nw26r.eastus.cloudapp.azure.com
wp_path=$8  # /azlamp/html
wp_data_path=$9   # /azlamp/data

download_content()
{
 az storage blob download --account-name $storage_name --container-name $container_name --name $blob_storage  --file /home/$user_name/$blob_storage --sas-token "$SAS_token"
}

extracttar(){
    tar -xvf storage.tar/
    sudo mv $storage_dir_path/site/$target_dns_name $wp_path
    sudo mv $storage_dir_path}}/data/$target_dns_name}} $wp_data_path
}



#extracttar >> /tmp/logimport.txt
download_content >> /tmp/logimport.txt


