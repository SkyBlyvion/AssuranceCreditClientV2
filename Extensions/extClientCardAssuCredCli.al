pageextension 50002 extClientCardAssuCredCli extends "Customer Card"
{
    layout
    {
        addafter("General")
        // Add the "Assurance Details" group after the "General" group
        // Ajoute un champ DecisionAssuranceDisplay pour afficher la désignation de la décision d'assurance sur la Customer Card.
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

    // Variable to temporarily store the data
    var
        DecisionAssuranceDisplay: Text[50]; // Update to Text[50] to match Designation FR length

    trigger OnAfterGetRecord()
    var
        AssuranceCreditClient: Record "Assurance Credit Client";
        DecisionOrgAssuranceClient: Record "Decision Org Assurance Client";
    begin
        // Initialize display value
        DecisionAssuranceDisplay := 'Not Found';

        // Use the customer number to retrieve the corresponding record from "Assurance Credit Client"
        if AssuranceCreditClient.Get(Rec."No.") then begin
            // Use the "Decision Assurance" code to retrieve the designation from "Decision Org Assurance Client"
            if DecisionOrgAssuranceClient.Get(AssuranceCreditClient."Decision Assurance") then begin
                DecisionAssuranceDisplay := DecisionOrgAssuranceClient."Designation FR";
            end;
        end;
    end;
}
