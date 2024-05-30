permissionset 50007 "Customer Credit Perm"
{
    Assignable = true;
    Caption = 'Client Assurance Credit Permissions'; // Correctly terminated with a semicolon

    Permissions =
        tabledata "Assurance Credit Client" = RMID, // Correct permissions for table
        tabledata "Decision Org Assurance Client" = RIMD, // Correct permissions for table
        page "Assurance Credit Client List" = X, // Correct permissions for page
        page "Decision Org Ass Client List" = X; // Correct permissions for page





}




