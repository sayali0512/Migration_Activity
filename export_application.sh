#!/bin/bash

storage_name=$1                   # storage account name
container_name=$2                 # container name
user_name=$3                      # user name
file_path=/home/$3/$4.tar         # tar file path /home/azureadmin/storage.tar  $4=storage.tar
blob_storage=$6/$HOSTNAME/$4.tar  # blob file name /vmname/
SAS_token=$5                      # SAS token
storage_dir_path=/home/$3/$4      # storage folder path /home/azureadmin/storage $4=storage
source_dns_name=$6                # dns name
wp_path=$7                        # azlamp/html
wp_data_path=$8                   # azlamp/data

copysitetostorage(){
    echo "copysitetostorage"
    sudo mkdir $storage_dir_path
    sudo mkdir $storage_dir_path/$HOSTNAME
    sudo mkdir $storage_dir_path/$HOSTNAME/site
    sudo cp -rf $wp_path/$source_dns_name/ $storage_dir_path/$HOSTNAME/site
}

copydatatostorage(){
    echo "copydatatostorage"
    sudo mkdir $storage_dir_path/$HOSTNAME/data
    sudo cp -rf $wp_data_path/$source_dns_name $storage_dir_path/$HOSTNAME/data
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
   #az storage blob upload --account-name $storage_name --container-name $container_name --file $file_path --name $blob_storage --sas-token $SAS_token
    sudo azcopy copy '/home/azureadmin/storage.tar' 'https://abs5nw26r.blob.core.windows.net/demo/lb-5nw26r.eastus.cloudapp.azure.com/?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2020-07-30T14:32:28Z&st=2020-07-30T06:32:28Z&spr=https&sig=BktAkNlQCtqh8I307hqO2eBXtzeT6g%2Fp8TGurjktgIE%3D'

}


copysitetostorage >> /tmp/storage_logs.txt
copydatatostorage >> /tmp/storage_logs.txt
createstoragetar >> /tmp/storage_logs.txt
create_container >> /tmp/storage_logs.txt
#install_azcopy >> /tmp/storage_logs.txt
upload_files  >> /tmp/storage_logs.txt
