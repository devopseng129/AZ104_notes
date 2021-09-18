// create_SAS_tokens_associate_with_stored_access_policies
BlobSasBuilder sas = new BlobSasBuilder
{
    BlobContainerName = blob.BlobContainerName,
    BlobName = blob.Name,
    Resource = "b",
    ExpiresOn = DatetimeOffset.UtcNow.AddMinutes(1)
};

//Allow read access
sas.SetPermissions(BlobSasPermissions.Read);

