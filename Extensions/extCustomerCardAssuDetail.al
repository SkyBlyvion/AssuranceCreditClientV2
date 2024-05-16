pageextension 50101 extCustomerCardAssuDetails extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        // Run pages after processing, in the actionbar area
        // Ajoute des actions pour ouvrir les listes et les cartes liées aux clients d'assurance crédit et aux décisions d'assurance.
        {
            action("Assurance Credit Client List")
            {
                ApplicationArea = All;
                Caption = 'Assurance Credit Clients';
                ToolTip = 'Open the Assurance Credit Client list';
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Assurance Credit Client List");
                end;
            }

            action("Assurance Credit Client Card")
            {
                ApplicationArea = All;
                Caption = 'Assurance Credit Client Card';
                ToolTip = 'Open the Assurance Credit Client card';
                trigger OnAction()
                var
                    AssuranceCreditClientRec: Record "Assurance Credit Client";
                begin
                    if not AssuranceCreditClientRec.Get(Rec."No.") then begin
                        AssuranceCreditClientRec.Init();
                        AssuranceCreditClientRec."Code Client" := Rec."No.";
                        AssuranceCreditClientRec.Insert(true); // True for AutoIncrement
                    end;
                    PAGE.Run(PAGE::"Assurance Credit Client Card", AssuranceCreditClientRec);
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
