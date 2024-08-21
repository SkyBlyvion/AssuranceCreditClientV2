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
                field("Designation FR"; Rec."Designation FR")
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
                field("Numero Dossier"; Rec."Numero Dossier")
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
            // c'est l'ors de l'action New que l'on préremplit le code client, il est ensuite filtré dans la pageList pour n'afficher que le client correspondant
            action("New Assurance Credit Client")
            {
                ApplicationArea = All;
                Caption = 'Nouveau';
                ToolTip = 'Créer un nouveau enregistrement pour l''assurance de crédit client';
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
        area(Processing)
        {
            action("Edit Assurance Credit Client")
            {
                ApplicationArea = All;
                Caption = 'Modifier';
                ToolTip = 'Modifier l''enregistrement d''assurance crédit sélectionné';
                Image = Edit;

                trigger OnAction()
                begin
                    if Rec.FindFirst then begin
                        // Ouvrir la page de carte pour le record sélectionné
                        PAGE.RunModal(PAGE::"Assurance Credit Client Card", Rec);
                        CurrPage.Update();
                    end else begin
                        Message('Aucun enregistrement sélectionné pour modification.');
                    end;
                end;
            }
            action("Supprimer un enregistrement")
            {
                ApplicationArea = All;
                Caption = 'Supprimer';
                ToolTip = 'Supprimer un enregistrement';
                Image = Delete;

                trigger OnAction()
                begin
                    // Ensure a record is selected
                    if Rec.Get(Rec."Code Client", Rec."Date") then begin
                        // Confirm the deletion
                        if Confirm('Êtes-vous sûr de vouloir supprimer cet enregistrement ?', false) then begin
                            // Delete the selected record
                            Rec.Delete(true);
                            // Refresh the page
                            CurrPage.Update();
                        end;
                    end else begin
                        Message('Aucun enregistrement à supprimer.');
                    end;
                end;
            }
        }
    }


}
