#!/bin/bash
# Export the storage.tar file to  Azure blob storage account
storage_name=abs5nw26r
container_name=migration
user_name=azureadmin
file_path=/home/azureadmin/backup.txt
blob_storage=backup.txt
SAS_token=?sv=2019-10-10&ss=bfqt&srt=sco&sp=rwdlacupx&se=2020-07-13T14:57:37Z&st=2020-07-13T06:57:37Z&spr=https&sig=VFdiIJmx3pnMdTcIMagmphRBCvYK8wyHJ7nDcHaOBqE%3D



# upload files to blob
upload_files(){
az storage blob upload --account-name $storage_name --container-name $container_name --file /home/azureadmin/backup.txt --name backup.txt --sas-token "$SAS_token"  
  
}


upload_files >> /home/azureadmin/storage_logs.txt




