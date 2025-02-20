# -------------------------------------------------- #
# Title: Phone Number Tester and Processor
# Description: Writing and Reading Data from a file
# ChangeLog (Who,When,What):
# GObse,02/17/2025,Created started script
# -------------------------------------------------- #
import re
import csv

# Define file paths
strTestDataFileName = r"C:\Data\TestData.csv.txt"
strValidDataFileName = r"C:\Data\ValidData.csv.txt"
strBadDataFileName = r"C:\Data\BadData.csv.txt"

# Regex pattern for phone number validation
strRegex = r'^\d{3}-\d{3}-\d{4}$'

# Open files
with open(strTestDataFileName, 'r', newline='') as objTestDataStream, \
     open(strValidDataFileName, 'w', newline='') as objValidDataStream, \
     open(strBadDataFileName, 'w', newline='') as objBadDataStream:

    # Read input data
    csvReader = csv.reader(objTestDataStream)
    csvWriterValid = csv.writer(objValidDataStream)
    csvWriterBad = csv.writer(objBadDataStream)

    # Read and write the header row to both output files
    headers = next(csvReader)
    csvWriterValid.writerow(headers)
    csvWriterBad.writerow(headers)

    # Process each row
    for row in csvReader:
        if len(row) < 4:
            continue  # Skip rows with missing columns

        customer_phone = row[3].strip()  # Extract the CustomerPhone column

        if re.match(strRegex, customer_phone):  # Check if phone number is valid
            print(f"Valid: {customer_phone}")
            csvWriterValid.writerow(row)  # Write valid row
        else:
            print(f"Invalid: {customer_phone}")
            csvWriterBad.writerow(row)  # Write invalid row

