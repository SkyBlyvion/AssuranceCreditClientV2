page 50015 "Assurance Credit Client Card"
{
    PageType = Card; // Type de page
    SourceTable = "Assurance Credit Client"; // Table source
    ApplicationArea = All; // Zone d'application
    Editable = true; // Page editable

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Code Client"; Rec."Code Client") // Champ pour afficher le code du client
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
                    // Création d'un menu déroulant basé sur la table "Decision Org Assurance Client"
                    TableRelation = "Decision Org Assurance Client".Code;
                }
                field("Designation FR"; Rec."Designation FR")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Designation ES"; Rec."Designation ES")
                {
                    ApplicationArea = All;
                    Editable = false;
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
