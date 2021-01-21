# https://cran.r-project.org/web/packages/AzureStor/vignettes/intro.html

library(AzureStor)


tenant_id <- "your_tenant_id_here"
client_id <- "your_client_id_here"
secret_id <- "your_secrat_id_here"

token <- AzureRMR::get_azure_token("https://storage.azure.com",
                                   tenant=tenant_id, 
                                   app=client_id, 
                                   password=secret_id)

# Replace with storage account name 
ad_endp_tok2 <- storage_endpoint("https://storage_account_name.blob.core.windows.net", token=token)
list_storage_containers(ad_endp_tok2)

# Replace container name
cont <- storage_container(ad_endp_tok2, "container_name")
list_storage_files(cont)

# Replace path to file
storage_download(cont, "folder/path/goes/here/file.csv", overwrite = T)
