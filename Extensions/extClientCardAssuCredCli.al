// Cette pageextension permet d'afficher les informations de la table Assurance Credit Client et Decision Org Assurance Client sur la fiche client
pageextension 50002 extClientCardAssuCredCli extends "Customer Card"
{
    layout
    {
        addafter("Credit Limit (LCY)")
        // Ajouter le groupe "Assurance Details" après le groupe "General"
        {
            field("DecisionAssuranceDisplay"; DecisionAssuranceDisplay)
            {
                ApplicationArea = All;
                Caption = 'Decision Assurance';
                ToolTip = 'Décision d''assurance du client';
            }

        }
    }

    // Variables pour stocker temporairement les données
    var
        DecisionAssuranceDisplay: Text[50]; // Variable pour afficher la décision d'assurance

    trigger OnAfterGetRecord()
    var
        AssuranceCreditClient: Record "Assurance Credit Client"; // Enregistrement pour la table "Assurance Credit Client"
        DecisionOrgAssuranceClient: Record "Decision Org Assurance Client"; // Enregistrement pour la table "Decision Org Assurance Client"
    begin
        // Initialize display values
        DecisionAssuranceDisplay := 'Non Renseigné'; // Valeur par défaut si aucune décision d'assurance n'est trouvée

        // Filtrer pour obtenir l'enregistrement le plus récent pour le client
        AssuranceCreditClient.SetCurrentKey("Code Client", "Date"); // definit la clé de tri
        AssuranceCreditClient.SetRange("Code Client", Rec."No."); // filtre les records pour correspondre au client
        if AssuranceCreditClient.FindLast() then

            // Utiliser le code de "Decision Assurance" pour récupérer la désignation de "Decision Org Assurance Client"
            if DecisionOrgAssuranceClient.Get(AssuranceCreditClient."Decision Assurance") then
                DecisionAssuranceDisplay := DecisionOrgAssuranceClient."Designation FR";
    end;
}
