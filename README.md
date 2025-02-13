# import-data-from-excel-including-lookup-column-to-sharepoint-list-using-powerShell

# Import Excel Data to SharePoint List Using PowerShell | PnP PowerShell Script

This PowerShell script provides a simple and efficient way to import data from an Excel file to a SharePoint list. The script handles various data types such as text, numbers, and dates, including lookup columns like **Expense Category**, **Payment Method**, **Status**, and **Department**. Using the PnP PowerShell module, it connects to your SharePoint Online site, processes the Excel data, and inserts the data directly into the specified SharePoint list.

## Features

- Import data from Excel to SharePoint Online list using PowerShell.
- Handle lookup columns in SharePoint (e.g., **Expense Category**, **Payment Method**, **Status**).
- Support for date columns with proper parsing (`dd/MM/yyyy` format).
- Easy-to-use script to automate data import into SharePoint Online.
- Fully customizable to fit your organization's SharePoint setup and Excel data structure.
- Connect to SharePoint Online using `Connect-PnPOnline` and run the import operation seamlessly.

## Prerequisites

- PowerShell 7 or later.
- [PnP PowerShell](https://pnp.github.io/powershell/) module.
- Microsoft Excel file with data to import.
- A SharePoint Online site and list for importing the data.

## Steps to Import Excel Data to SharePoint List Using PowerShell

1. **Install PnP PowerShell Module**:
   Ensure that the `PnP.PowerShell` module is installed by running:
   ```powershell
   Install-Module -Name PnP.PowerShell -Force -Scope CurrentUser
