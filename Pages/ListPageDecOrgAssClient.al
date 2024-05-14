page 50101 "Decision Org Assurance Client List"
{
    PageType = List;
    SourceTable = "Decision Org Assurance Client";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
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
            action(New)
            {
                ApplicationArea = All;
                Caption = 'New';
                ToolTip = 'Create a new record';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    CurrPage.Edit(true);
                    CurrPage.Insert(true);
                end;
            }

            action(Edit)
            {
                ApplicationArea = All;
                Caption = 'Edit';
                ToolTip = 'Edit the selected record';
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
