page 50015 "Assurance Credit Client Card"
{
    PageType = Card;
    SourceTable = "Assurance Credit Client";
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Code Client"; Rec."Code Client")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Decision Assurance"; Rec."Decision Assurance")
                {
                    ApplicationArea = All;
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

    actions
    {
        area(processing)
        {
            action(Edit)
            {
                ApplicationArea = All;
                Caption = 'Edit';
                ToolTip = 'Edit this record';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    CurrPage.Edit(true);
                end;
            }
        }
    }
}
