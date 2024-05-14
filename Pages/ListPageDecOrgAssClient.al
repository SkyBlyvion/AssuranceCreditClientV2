page 50101 "Decision Org Ass Client List"
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

}
