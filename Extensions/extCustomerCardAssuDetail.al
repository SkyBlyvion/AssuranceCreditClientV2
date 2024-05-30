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
                    CustomerNo: Code[20]; // Code du client
                begin
                    // Affecter le numéro du client actuel à la variable CustomerNo
                    CustomerNo := Rec."No.";

                    // Créer un nouvel enregistrement dans la table Assurance Credit Client
                    AssuranceCreditClientRec.Init();
                    AssuranceCreditClientRec."Code Client" := CustomerNo; // Affecter le numéro du client à la propriété "Code Client" de l'enregistrement AssuranceCreditClientRec
                    AssuranceCreditClientRec.Insert(true); // Insérer et exécuter le trigger OnInsert

                    // Valider la transaction pour éviter les problèmes de verrouillage
                    COMMIT;

                    // Ouvrir le nouvel enregistrement créé pour édition
                    PAGE.RunModal(PAGE::"Assurance Credit Client Card", AssuranceCreditClientRec);

                    // Après l'édition, ouvrir la page de liste filtrée par le code du client actuel
                    PAGE.RunModal(PAGE::"Assurance Credit Client List", AssuranceCreditClientRec);
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
