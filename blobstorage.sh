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


# az storage container create \
    # --account-name <storage-account> \
    # --name <container> \
    # --auth-mode login

az storage container create \
    --account-name abs5nw26r \
    --name testcontainer \
    --auth-mode login

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
az storage blob upload --account-name abs5nw26r --account-key $key --container-name testcontainer --file /home/azureadmin/wordpress.txt --name myblob

