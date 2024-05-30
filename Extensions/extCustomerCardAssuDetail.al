pageextension 50003 extCustomerCardAssuDetails extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        // Run pages after processing, in the actionbar area
        // Ajoute des actions pour ouvrir les listes et les cartes liées aux clients d'assurance crédit et aux décisions d'assurance.
        {
            // open the Assurance Credit Client list
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


            // open the Decision Org Assurance Client list
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
