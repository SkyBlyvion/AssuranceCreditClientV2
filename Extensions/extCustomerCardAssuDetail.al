pageextension 50101 extCustomerCardAssuDetails extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        {
            action("Assurance Credit Client List")
            {
                ApplicationArea = All;
                Caption = 'Assurance Credit Clients';
                ToolTip = 'Open the Assurance Credit Client list';
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Assurance Credit Client List");
                end;
            }

            action("Assurance Credit Client Card")
            {
                ApplicationArea = All;
                Caption = 'Assurance Credit Client Card';
                ToolTip = 'Open the Assurance Credit Client card';
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Assurance Credit Client Card");
                end;
            }

            action("Decision Org Assurance Client List")
            {
                ApplicationArea = All;
                Caption = 'Decision Org Assurance Clients';
                ToolTip = 'Open the Decision Org Assurance Client list';
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Decision Org Assurance Client List");
                end;
            }

            action("Decision Org Assurance Client Card")
            {
                ApplicationArea = All;
                Caption = 'Decision Org Assurance Client Card';
                ToolTip = 'Open the Decision Org Assurance Client card';
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Decision Org Assurance Client Card");
                end;
            }
        }
    }
}
