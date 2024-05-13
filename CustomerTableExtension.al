tableextension 50102 CustomerExtension extends Customer
{
    fields
    {
        // Ajouter un champ pour stocker la décision de l'assurance crédit
        field(50100; "Decision Assurance"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Assurance Credit Client"."Decision Assurance";
            Caption = 'Decision Assurance';
        }
    }
}
