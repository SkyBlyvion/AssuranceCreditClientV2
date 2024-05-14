page 50100 "Decision Org Ass Client Card"
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


}
