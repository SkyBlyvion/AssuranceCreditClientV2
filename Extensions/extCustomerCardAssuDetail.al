/* Cette pageextension ajoute 2 actions dans la Customer Card topbar.
   La première ouvre une modale et crée un record dans la table Assurance Credit Client et préremplit le code client.
   La deuxième ouvre la page Decision Org Assurance Client, où l'on renseigne les décisions et leurs codes. */
pageextension 50003 extCustomerCardAssuDetails extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        {
            action("Assurance Credit Client List")
            {
                ApplicationArea = All;
                Caption = 'Assurance Credit Client';
                ToolTip = 'Ouvrir la liste des clients assurance crédit';
                trigger OnAction()
                // declaration des variables
                var
                    AssuranceCreditClientRec: Record "Assurance Credit Client";
                    CustomerRec: Record "Customer";
                begin
                    // Affecter le numéro du client actuel à la variable CustomerNo
                    CustomerRec.get(Rec."No.");

                    // Pass the "Customer No." as a filter to the list page
                    AssuranceCreditClientRec.SetRange("Code Client", CustomerRec."No.");
                    PAGE.RunModal(PAGE::"Assurance Credit Client List", AssuranceCreditClientRec); // open the list page
                end;
            }

            action("Decision Org Assurance Client List")
            {
                ApplicationArea = All;
                Caption = 'Decision Org Assurance Client';
                ToolTip = 'Ouvrir la liste des décisions des clients assurance';
                trigger OnAction()
                begin
                    // Ouvrir la page de la liste des décisions des clients assurance
                    PAGE.Run(PAGE::"Decision Org Ass Client List");
                end;
            }
        }
    }
}
