# Link for azcopy documentation
# https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10

# Download and upload blobstorage reference 
# https://docs.microsoft.com/en-us/azure/storage/common/storage-ref-azcopy-copy

# First download AZCOPY from https://aka.ms/downloadazcopy-v10-linux 
# It will download tar file 

#Download AzCopy
wget https://aka.ms/downloadazcopy-v10-linux
 
#Extract Archive
tar -xvf downloadazcopy-v10-linux
 
#(Optional) Remove existing AzCopy version
sudo rm /usr/bin/azcopy
 
#Move AzCopy to the destination you want to store it
sudo cp ./azcopy_linux_amd64_*/azcopy /usr/bin/

azcopy login
azcopy copy 'C:\myDirectory\myTextFile.txt' 'https://mystorageaccount.blob.core.windows.net/mycontainer/myTextFile.txt'

azcopy make '/home/azueradmin/wordpress.txt https://abs5nw26r.blob.core.windows.net/mycontainer'

# az account set --subscription "My Demos"
az account set --subscription "ComputePM LibrarySub - 020"

# az storage account create \
#     --name <storage-account> \
#     --resource-group <resource-group> \
#     --location <location> \
#     --sku Standard_ZRS \
#     --encryption-services blob


# az group create \
#     --name <resource-group> \
#     --location <location>

az group create \
    --name testblob \
    --location eastus


az storage account create -n po9iu -g testblob -l eastus --sku Standard_LRS
#az storage account create -n po9iu -g testblob --kind StorageV2 -l eastus -t Account


az storage container create --account-name po9iu --name testcontainer2 --auth-mode login

# az storage blob upload \
    # --account-name <storage-account> \
    # --container-name <container> \
    # --name helloworld \
    # --file helloworld \
    # --auth-mode login

az storage blob upload \
    --account-name abs5nw26r \
    --container-name testcontainer \
    --name wordpress \
    --file wordpress.txt \
    --auth-mode login

# az storage blob upload -f /path/to/file -c MyContainer -n MyBlob

az storage blob upload -f /home/azureadmin/wordpress.txt -c abs5nw26r -n testcontainer
key=ZJHjzd5HgToRiVx/W7r87f+kO792/dtYNwfEem0h5BPeuSli46k0s5gVLbqyTYG1fUB/cdlPuSNKth2PmhlyAg==
# az storage blob upload --account-name mystorageaccount --account-key 0000-0000 --container-name mycontainer --file /path/to/file --name myblob
az storage blob upload --account-name po9iu --account-key kfrHXPArfQZHNGXNYWa/80H/JIyVYOhkMtq/Qbe5BkZ+6gkSR9UtnWgutZEK6vPC+eAEqWtAAH1GojmaLJwGSw== --container-name testcontainer --file /home/azureadmin/wordpress.txt --name myblob



# az storage blob download \
#     --account-name <storage-account> \
#     --container-name <container> \
#     --name helloworld \
#     --file ~/destination/path/for/file \
#     --auth-mode login

az storage blob download \
    --account-name po9iu \
    --container-name testcontainer \
    --name myblob \
    --file /home/azureadmin/backup.txt \
    --account-key kfrHXPArfQZHNGXNYWa/80H/JIyVYOhkMtq/Qbe5BkZ+6gkSR9UtnWgutZEK6vPC+eAEqWtAAH1GojmaLJwGSw==


