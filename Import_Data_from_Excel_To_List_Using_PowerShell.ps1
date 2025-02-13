1)....Install Required Modules --

Install-Module -Name PnP.PowerShell -Force -Scope CurrentUser

2)...Connect to SharePoint ---

# Connect to SharePoint Online
 Connect-PnPOnline -Url "https://futurrizoninterns.sharepoint.com/sites/lookUpDataTesting" -UseWebLogin

3).. verify connected site

Get-PnPWeb

4)...Load Excel File and Read Data


$ExcelFilePath = ""C:\Users\91915\Downloads\Data 1.xlsx""
$ExcelData = Import-Excel -Path $ExcelFilePath

5).. verify the excel data

$ExcelData | Select-Object -First 5

6)...Import Data to SharePoint List

# SharePoint list name
$ListName = "MainList"

foreach ($Row in $excelData) {

	    $dateValue = $null
            $approvalDateValue = $null

            # Correct date parsing with format dd/MM/yyyy
            if ([string]::IsNullOrWhiteSpace($Row.Date) -eq $false) {
             	$dateValue = [datetime]::ParseExact($Row.Date, 'dd/MM/yyyy', $null)
            }
            if ([string]::IsNullOrWhiteSpace($Row.'Approval Date') -eq $false) {
             	$approvalDateValue = [datetime]::ParseExact($Row.'Approval Date', 'dd/MM/yyyy', $null)
            }

	    $Title = $Row.'Expense ID';
            $Date = $dateValue;
            $ExpenseCategory = $Row.'Expense Category';
            $Amount = $Row.'Amount ($)';
            $BudgetAllocated = [decimal]$Row.'Budget Allocated ($)'
	    $BudgetUtilization = $Row.'Budget Utilization(%)';
            $PaymentMethod = $Row.'Payment Method';
            $Vendor = $Row.'Vendor/Supplier';
            $Status = $Row.Status;
            $ApprovalDate = $approvalDateValue;
            $ApproverName = $Row.'Approver Name';
            $Department = $Row.Department;
            $EmployeeName = $Row.'Employee Name';
            $EmployeeID = $Row.'Employee ID';

       $expenseCategoryId = (Get-PnPListItem -List "ExpenseCategoryList" -Query "<View><Query><Where><Eq><FieldRef Name='Title'/><Value Type='Text'>$ExpenseCategory</Value></Eq></Where></Query></View>").FieldValues["ID"]

       $paymentId = (Get-PnPListItem -List "PaymentMethodList" -Query "<View><Query><Where><Eq><FieldRef Name='Title'/><Value Type='Text'>$PaymentMethod</Value></Eq></Where></Query></View>").FieldValues["ID"]
       
       $StatusId = (Get-PnPListItem -List "Status" -Query "<View><Query><Where><Eq><FieldRef Name='Title'/><Value Type='Text'>$Status</Value></Eq></Where></Query></View>").FieldValues["ID"]

       $departmentId = (Get-PnPListItem -List "DepartmentList" -Query "<View><Query><Where><Eq><FieldRef Name='Title'/><Value Type='Text'>$Department</Value></Eq></Where></Query></View>").FieldValues["ID"]

     Add-PnPListItem -List $listName -Values @{
           "Title" = $Title
	   "Date"=$Date
	   "ExpenseCategory"=$expenseCategoryId
	   "Amount"=$Amount
	   "BudgetAllocated"=$BudgetAllocated
	   "BudgetUtilization"=$BudgetUtilization
	   "PaymentMethod"=$paymentId
	   "Vendor_x002f_Supplier"=$Vendor
	   "Status"=$StatusId
	   "ApprovalDate"=$ApprovalDate
	   "ApproverName"=$ApproverName
	   "Department"=$departmentId
	   "EmployeeName"=$EmployeeName
	   "EmployeeID"=$EmployeeID		

   }
 }
7)... Clean Up and Disconnect

# Disconnect from SharePoint
Disconnect-PnPOnline
