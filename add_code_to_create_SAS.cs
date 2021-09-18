// Add code to create a SAS
// file to edit: Controllers/PatientRecordController.cs

// under GET PatientREcord/patient-nnnnnn method

//GET PatientREcord/paitner-nnnnnn/secure
[HttpGet("{Name}/{secure}")]
public PatientRecord Get(string name, string flag)
{
    BlobClient blob = _container.GetBlobClient(name);
    return new PatientRecord { name=blob.Name, imageURI=blob.Uri.AbsoluteUri, sasToken=GetBlobSas(blob) };
}

    // returns requested patient image with a SAS that can be used to access it


// Add method that creates the SAS for the blob
//build SAS token for given blob
private string GetBlobSas(BlobClient blob)

    // crate user SAS - read - 1 minute
    BlobSasBuilder sas = new BlobSasBuilder
    {
        BlobContainerName = blob.BlobContainerName,
        BlobName = blob.Name,
        Resource = "b",
        ExpiresOn = DateTimeOffset.UtcNow.AddMinutes(1)

    };

    // allow read access
    sas.SetPermissions(BlobSasPermissions.Read);

    // use shared key to access the blob
    var storageSharedKeyCredential = new storageSharedKeyCredential(
        _iconfiguration.GetValue<string>("StorageAccount:AccountName"),
        _iconfiguration.GetValue<string>("StorageAccount:AccountKey")
    );

    return '?' + sas.ToSasQueryParameters(storageSharedKeyCredential).ToString();

    