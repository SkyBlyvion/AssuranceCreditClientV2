page 50006 "Assurance Credit Client Card"
{
    PageType = Card;
    SourceTable = "Assurance Credit Client";
    ApplicationArea = All;
    Editable = true;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Code Client"; Rec."Code Client")
                {
                    ApplicationArea = All;
                    Editable = false; // Ne permet pas de modifier le Code Client
                    TableRelation = Customer."No.";
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Decision Assurance"; Rec."Decision Assurance")
                {
                    ApplicationArea = All;
                    TableRelation = "Decision Org Assurance Client".Code;
                }
                field("Valeur"; Rec."Valeur")
                {
                    ApplicationArea = All;
                }
                field("Raison"; Rec."Raison")
                {
                    ApplicationArea = All;
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
