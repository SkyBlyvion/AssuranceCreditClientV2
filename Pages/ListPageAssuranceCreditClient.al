page 50004 "Assurance Credit Client List"
{
    PageType = List;
    SourceTable = "Assurance Credit Client";
    ApplicationArea = All;
    Editable = true; // Permettre l'édition directe dans la liste

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Client"; Rec."Code Client")
                {
                    ApplicationArea = All;
                    Editable = true; // Permettre l'édition pour la création d'un nouvel enregistrement
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
