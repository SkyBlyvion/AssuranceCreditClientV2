pageextension 50002 extClientCardAssuCredCli extends "Customer Card"
{
    layout
    {
        addafter("General")
        // Add the "Assurance Details" group after the "General" group
        {
            group("Assurance Details")
            {
                field("DecisionAssuranceDisplay"; DecisionAssuranceDisplay)
                {
                    ApplicationArea = All;
                    Caption = 'Decision Assurance';
                    ToolTip = 'Shows the decision assurance based on customer number.';
                }
                field("ValeurDisplay"; ValeurDisplay)
                {
                    ApplicationArea = All;
                    Caption = 'Valeur';
                    ToolTip = 'Shows the most recent valeur for the customer.';
                }
            }
        }
    }

    // Variables to temporarily store the data
    var
        DecisionAssuranceDisplay: Text[50];
        ValeurDisplay: Decimal;

    trigger OnAfterGetRecord()
    var
        AssuranceCreditClient: Record "Assurance Credit Client";
        DecisionOrgAssuranceClient: Record "Decision Org Assurance Client";
    begin
        // Initialize display values
        DecisionAssuranceDisplay := 'Not Found';
        ValeurDisplay := 0;

        // Filter to get the most recent record for the customer
        AssuranceCreditClient.SetCurrentKey("Code Client", "Date");
        AssuranceCreditClient.SetRange("Code Client", Rec."No.");
        if AssuranceCreditClient.FindLast() then begin
            // Get the most recent Valeur
            ValeurDisplay := AssuranceCreditClient."Valeur";

            // Use the "Decision Assurance" code to retrieve the designation from "Decision Org Assurance Client"
            if DecisionOrgAssuranceClient.Get(AssuranceCreditClient."Decision Assurance") then begin
                DecisionAssuranceDisplay := DecisionOrgAssuranceClient."Designation FR";
            end;
        end;
    end;
}
