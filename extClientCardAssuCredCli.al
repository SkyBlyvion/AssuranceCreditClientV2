pageextension 50100 extClientCardAssuCredCli extends "Customer Card"
{
    layout
    {
        addafter("General")
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
        // Utilisez le numéro de client pour récupérer l'enregistrement correspondant
        if AssuranceCreditClient.Get('Code Client', Rec."No.") then
            DecisionAssuranceDisplay := AssuranceCreditClient."Decision Assurance"
        else
            DecisionAssuranceDisplay := ''; // Assurez-vous que le champ est affiché même s'il est vide
    end;
}
