# create a new user
New-AzureADUser

# bulk invitation

$invitations = import-csv c:\filepath\invitation_list.csv
$messageInfo = New-Object Microsoft.Open.MSGraph.Model.InvitedUserMessageInfo

$messageInfo.customizedMessageBody = 'Sup, You are invited'

foreach ($email in $invitations)
    {New-AzureADMSInvitation `
        -InvitedUserEmailAddress $email.InvitedUserEmailAddress `
        -InvitedUserDisplayName $email.Name `
        -InvitedRedirectUrl https://myapps.microsoft.com `
        - InvitedUserMessageInfo $messageInfo `
    }

# remove users
Remove-AzureADUser


