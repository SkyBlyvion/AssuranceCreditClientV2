page 50016 "Assurance Credit Client List"
{
    PageType = List;
    SourceTable = "Assurance Credit Client";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
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
