tableextension 50001 CustomerExtension extends Customer
{
    fields
    {
        // Ajoute un champ Decision Assurance à la table Customer.
        //Permet d'afficher directement cette information sur la Customer Card.
        field(50100; "Decision Assurance"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Assurance Credit Client"."Decision Assurance";
            Caption = 'Decision Assurance';
        }
    }
}
