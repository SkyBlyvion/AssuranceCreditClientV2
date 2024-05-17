page 50004 "Assurance Credit Client List"
{
    // Define the page as a List page
    PageType = List;

    // Specify the source table for this page
    SourceTable = "Assurance Credit Client";

    // Specify the application area for this page
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // Display the "Code Client" field from the source table
                field("Code Client"; Rec."Code Client")
                {
                    ApplicationArea = All;
                }
                // Display the "Date" field from the source table
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                // Display the "Decision Assurance" field from the source table
                field("Decision Assurance"; Rec."Decision Assurance")
                {
                    ApplicationArea = All;
                    TableRelation = "Decision Org Assurance Client".Code; // Create Drop-Down

                }
                // Display the "Valeur" field from the source table
                field("Valeur"; Rec."Valeur")
                {
                    ApplicationArea = All;
                }
                // Display the "Raison" field from the source table
                field("Raison"; Rec."Raison")
                {
                    ApplicationArea = All;
                }
                // Display the "Case Number" field from the source table
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // Define the New action button
            action(New)
            {
                ApplicationArea = All;
                Caption = 'New'; // Button caption
                ToolTip = 'Create a new record'; // Tooltip for the button
                Promoted = true; // Promote the button to the ribbon
                PromotedCategory = Process; // Group it under the Process category in the ribbon

                // Action trigger to run when the button is clicked
                trigger OnAction()
                begin
                    // Open the Assurance Credit Client Card page to create a new record
                    PAGE.Run(PAGE::"Assurance Credit Client Card");
                end;
            }

            // Define the Edit action button
            action(Edit)
            {
                ApplicationArea = All;
                Caption = 'Edit'; // Button caption
                ToolTip = 'Edit the selected record'; // Tooltip for the button
                Promoted = true; // Promote the button to the ribbon
                PromotedCategory = Process; // Group it under the Process category in the ribbon

                // Action trigger to run when the button is clicked
                trigger OnAction()
                begin
                    // Open the Assurance Credit Client Card page to edit the selected record
                    PAGE.Run(PAGE::"Assurance Credit Client Card", Rec);
                end;
            }
        }
    }
}
