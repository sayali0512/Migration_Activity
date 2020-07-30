#!/bin/bash

echo storage_name=$1                   # storage account name
echo container_name=$2                 # container name
echo user_name=$3                      # user name
echo file_path=/home/$3/$4.tar         # tar file path /home/azureadmin/storage.tar  $4=storage.tar
echo blob_storage=$4.tar  # blob file name /vmname/
echo SAS_token=$5                      # SAS token
echo storage_dir_path=/home/$3/$4      # storage folder path /home/azureadmin/storage $4=storage
echo source_dns_name=$6                # dns name
echo wp_path=$7                        # azlamp/html
echo wp_data_path=$8                   # azlamp/data

copysitetostorage(){
    echo "copysitetostorage"
    sudo mkdir -p "$storage_dir_paths"
    sudo mkdir -p "$storage_dir_path"/"$source_dns_name"
    sudo mkdir -p :$storage_dir_path"/"$source_dns_name"/site
    sudo cp -rf $wp_path/$source_dns_name/ $storage_dir_path/$source_dns_name/site
}

copydatatostorage(){
    echo "copydatatostorage"
    sudo mkdir -p  "$storage_dir_path"/"$source_dns_name"/data
    sudo cp -rf $wp_data_path/$source_dns_name $storage_dir_path/$source_dns_name/data
}

createstoragetar(){
    echo "create storage tar"
    tar cf $storage_dir_path.tar $storage_dir_path
}

create_container(){
    echo "create_container"
    az storage container create --account-name $storage_name --name $container_name --sas-token $SAS_token
}
install_azcopy(){
    #Download AzCopy
    wget https://aka.ms/downloadazcopy-v10-linux
    #Expand Archive
    tar -xvf downloadazcopy-v10-linux
    #(Optional) Remove existing AzCopy version
    sudo rm /usr/bin/azcopy
    #Move AzCopy to the destination you want to store it
    sudo cp ./azcopy_linux_amd64_*/azcopy /usr/bin/

}

upload_files(){
    echo "upload_files"
    sudo azcopy copy '$file_path' 'https://$storage_name.blob.core.windows.net/container_name/$source_dns_name/$SAS_token'
}

copysitetostorage >> /tmp/storage_logs.txt
copydatatostorage >> /tmp/storage_logs.txt
createstoragetar >> /tmp/storage_logs.txt
create_container >> /tmp/storage_logs.txt
install_azcopy  >> /tmp/storage_logs.txt
upload_files >> /tmp/storage_logs.txt