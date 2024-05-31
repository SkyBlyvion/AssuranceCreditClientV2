/* Cette page affiche la liste des enregistrements de la table "Assurance Credit Client".
   Elle permet aux utilisateurs de visualiser les informations relatives à l'assurance crédit des clients
   et de créer de nouveaux enregistrements via l'action "Nouveau" dans la topbar. */
page 50004 "Assurance Credit Client List"
{
    PageType = List;
    SourceTable = "Assurance Credit Client";
    ApplicationArea = All;
    Editable = false; // Rendre la liste non éditable

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Client"; Rec."Code Client")
                {
                    ApplicationArea = All;
                    TableRelation = Customer."No.";
                    Visible = true; // Masquer le champ "Code Client"
                    Editable = false;
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

    actions
    {
        area(creation)
        {
            action("New Assurance Credit Client")
            {
                ApplicationArea = All;
                Caption = 'Nouveau';
                ToolTip = 'Créer un nouveau client assurance crédit';
                Image = NewDocument; // Utilisation d'une icône appropriée

                trigger OnAction()
                var
                    AssuranceCreditClientRec: Record "Assurance Credit Client";
                begin
                    // Créer un nouveau record et pre-fill avec "code client"
                    AssuranceCreditClientRec.Init(); // added at 12:03
                    AssuranceCreditClientRec."Code Client" := Rec.GetFilter("Code Client"); // added at 12:03
                    AssuranceCreditClientRec.Insert(true);

                    COMMIT;

                    // Ouvrir la page de carte client avec le nouveau record et permettre à l'utilisateur de le modifier
                    PAGE.RunModal(PAGE::"Assurance Credit Client Card", AssuranceCreditClientRec);

                    // Update the current page
                    CurrPage.Update();

                end;
            }
        }
    }


}
