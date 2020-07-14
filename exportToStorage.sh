#!/bin/bash

storage_name=$1
lb_name=$2
vm_name=$3
container_name=$4/$lb_name/$vm_name
user_name=$5
file_path=/home/$5/$6
blob_storage=$6
SAS_token=$7
storage_dir_path=$8  #/home/azureadmin/storage
source_dns_name=$9   #lb-5nw26r.eastus.cloudapp.azure.com
source_db_server_name=$10  #mysql-5nw26r.mysql.database.azure.com
source_db_login_name=$11  #dbadmin@mysql-5nw26r
source_db_pass=$12  #db password
source_db_name=$13  # wordpress
sql_dump_filename=$14  #database.sql
wp_path=$15    # /azlamp/html
wp_data_path=16    # /azlamp/data

copysitetostorage(){

sudo mkdir $storage_dir_path
sudo mkdir $storage_dir_path/site
sudo cp -rf $wp_path/$source_dns_name/ $storage_dir_path/site
}

copydatatostorage(){

sudo mkdir $storage_dir_path/data
sudo cp -rf $wp_data_path/$source_dns_name $storage_dir_path/data

}
databaseexport(){

sudo apt-get install mysql-server
sudo mysqldump -h $source_db_server_name -u $source_db_login_name -p$source_db_pass $source_db_name > $storage_dir_path/$sql_dump_filename

}
createstoragezip(){

tar cf $storage_dir_path.tar $storage_dir_path/
}

# upload files to blob
upload_files(){
az storage blob upload --account-name $storage_name --container-name $container_name --file /home/$user_name/$blob_storage --name $blob_storage --sas-token "$SAS_token"

}

copysitetostorage >> /home/azureadmin/storage_logs.txt
copydatatostorage >> /home/azureadmin/storage_logs.txt
databaseexport >> /home/azureadmin/storage_logs.txt
createstoragezip >> /home/azureadmin/storage_logs.txt
upload_files >> /home/azureadmin/storage_logs.txt