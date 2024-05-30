pageextension 50003 extCustomerCardAssuDetails extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        {
            action("Assurance Credit Client List")
            {
                ApplicationArea = All;
                Caption = 'Assurance Credit Clients';
                ToolTip = 'Open the Assurance Credit Client list';
                trigger OnAction()
                var
                    AssuranceCreditClientRec: Record "Assurance Credit Client";
                    CustomerNo: Code[20];
                begin
                    // Retrieve the current customer number
                    CustomerNo := Rec."No.";

                    // Create a new record in the Assurance Credit Client table
                    AssuranceCreditClientRec.Init();
                    AssuranceCreditClientRec."Code Client" := CustomerNo;
                    AssuranceCreditClientRec.Insert(true); // Insert and run OnInsert trigger

                    // Commit the transaction to avoid locking issues
                    COMMIT;

                    // Open the newly created record for editing
                    PAGE.RunModal(PAGE::"Assurance Credit Client Card", AssuranceCreditClientRec);

                    // After editing, open the list page filtered by the current customer's code
                    PAGE.RunModal(PAGE::"Assurance Credit Client List", AssuranceCreditClientRec);
                end;
            }

            action("Decision Org Assurance Client List")
            {
                ApplicationArea = All;
                Caption = 'Decision Org Assurance Clients';
                ToolTip = 'Open the Decision Org Assurance Client list';
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Decision Org Ass Client List");
                end;
            }
        }
    }
}
