page 50015 "Assurance Credit Client Card"
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
                    Editable = true;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Decision Assurance"; Rec."Decision Assurance")
                {
                    ApplicationArea = All;
                    Editable = true;
                    TableRelation = "Decision Org Assurance Client".Code; // Create Drop-Down
                }
                field("Valeur"; Rec."Valeur")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Raison"; Rec."Raison")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }
        }
    }


}
