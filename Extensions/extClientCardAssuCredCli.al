pageextension 50100 extClientCardAssuCredCli extends "Customer Card"
{
    layout
    {
        addafter("General")// pageextension customer card field Assurance Details
        {
            group("Assurance Details")
            {
                field("DecisionAssuranceDisplay"; DecisionAssuranceDisplay)
                {
                    ApplicationArea = All;
                    Caption = 'Decision Assurance';
                    ToolTip = 'Shows the decision assurance based on customer number.';
                }
            }
        }
    }

    // Variable pour stocker temporairement les données
    var
        DecisionAssuranceDisplay: Code[10];

    trigger OnAfterGetRecord()
    var
        AssuranceCreditClient: Record "Assurance Credit Client";
    begin
        //Message('Client No: %1', Rec."No.");

        // Utilisez le numéro de client pour récupérer l'enregistrement correspondant
        if AssuranceCreditClient.Get(Rec."No.") then begin
            DecisionAssuranceDisplay := AssuranceCreditClient."Decision Assurance";
            //Message('Decision Assurance Found: %1', DecisionAssuranceDisplay);
        end else begin
            // Gestion des enregistrements non trouvés
            //Message('Aucun enregistrement trouvé pour le client No: %1', Rec."No.");
            DecisionAssuranceDisplay := ''; // Assurez-vous que le champ est affiché même s'il est vide
        end;

        // Gestion des tables vides (le message sera affiché si aucun enregistrement n'est trouvé)
        if not AssuranceCreditClient.FindFirst() then begin
            //Message('La table "Assurance Credit Client" est actuellement vide.');
        end;
    end;
}
