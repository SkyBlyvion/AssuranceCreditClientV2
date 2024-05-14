page 50100 "Decision Org Assurance Client Card"
{
    PageType = Card;
    SourceTable = "Decision Org Assurance Client";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field("Designation FR"; Rec."Designation FR")
                {
                    ApplicationArea = All;
                }
                field("Designation ES"; Rec."Designation ES")
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
