page 50005 "Decision Org Ass Client List"
{
    // Définition de la page en tant que page de type Liste
    PageType = List;

    // Spécifie la table source pour cette page
    SourceTable = "Decision Org Assurance Client";

    // Définit la zone d'application pour cette page (accessible à tous)
    ApplicationArea = All;

    layout
    {
        area(content) // Zone de contenu de la page
        {
            repeater(Group) // Répétiteur pour afficher les enregistrements de manière répétée (multiRows)
            {
                // Champ pour afficher le code de la décision d'assurance
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }

                // Champ pour afficher la désignation en français de la décision d'assurance
                field("Designation FR"; Rec."Designation FR")
                {
                    ApplicationArea = All;
                }

                // Champ pour afficher la désignation en espagnol de la décision d'assurance
                field("Designation ES"; Rec."Designation ES")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
