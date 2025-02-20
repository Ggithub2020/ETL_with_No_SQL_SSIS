# -------------------------------------------------- 
# Title: Phone Number Tester and Processor
# Description: Reading and Writing Data from a CSV file
# ChangeLog (Who,When,What):
# GObse,02/17/2025,Created started script
# -------------------------------------------------- 

# Define file paths
$TestDataFile = C:\Data\TestData.csv.txt
$ValidDataFile = C:\Data\ValidData.csv.txt
$BadDataFile = C:\Data\BadData.csv.txt

# Regex pattern for phone number validation
$PhonePattern = '^\d{3}-\d{3}-\d{4}$'

# Read CSV data
$Data = Import-Csv -Path $TestDataFile

# Check if data exists
if ($Data.Count -eq 0) {
    Write-Host "No data found in the input file."
    exit
}

# Write headers to output files
$Data | Select-Object -First 1 | Export-Csv -Path $ValidDataFile -NoTypeInformation
$Data | Select-Object -First 1 | Export-Csv -Path $BadDataFile -NoTypeInformation

# Process each row
foreach ($row in $Data) {
    $CustomerPhone = $row.CustomerPhone.Trim()  # Extract phone number column

    if ($CustomerPhone -match $PhonePattern) {
        Write-Host "Valid: $CustomerPhone"
        $row | Export-Csv -Path $ValidDataFile -Append -NoTypeInformation
    } else {
        Write-Host "Invalid: $CustomerPhone"
        $row | Export-Csv -Path $BadDataFile -Append -NoTypeInformation
    }
}

Write-Host "Processing Complete. Check $ValidDataFile and $BadDataFile for results."
