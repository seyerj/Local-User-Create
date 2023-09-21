#############################
# 
# Josh Seyer
# 09/21/2023
#############################

# Define the path to the text file containing the list of names
$namesFilePath = "C:\Temp\local-usrs.txt"

# Read the list of names from the text file
$names = Get-Content $namesFilePath

# Loop through each name in the list
foreach ($name in $names) {
    # Check if a user account with this name exists
    if (-not (Get-LocalUser -Name $name -ErrorAction SilentlyContinue)) {
        # If the account doesn't exist, create it
        New-LocalUser -Name $name -noPassword -Description "Local user Account for $name"
        Set-LocalUser -Name $name -PasswordNeverExpires $true
        Write-Host "Created user account for $name."
    }
    else {
        Write-Host "User account for $name already exists."
    }
}