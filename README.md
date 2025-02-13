# import-data-from-excel-including-lookup-column-to-sharepoint-list-using-powerShell

# Import Data from Excel to SharePoint List Using PowerShell

This PowerShell script automates the process of importing data from an Excel file into a SharePoint list, including handling lookup columns for certain fields. The script performs the following tasks: installing the required modules, connecting to SharePoint Online, verifying the connection, loading and reading the Excel data, and importing it into the target SharePoint list.

## Requirements

- PowerShell 7 or later
- [PnP PowerShell](https://pnp.github.io/powershell/) module installed
- Excel file with data to be imported
- SharePoint Online site and list where the data will be imported

## Prerequisites

1. **Install PnP PowerShell Module**: You need to install the PnP PowerShell module if it’s not already installed. To install it, run the following command:
   ```powershell
   Install-Module -Name PnP.PowerShell -Force -Scope CurrentUser
