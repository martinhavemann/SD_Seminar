tableextension 123456700 "CSD ResourceExt" extends Resource
//CSD1.00 - 2018-01-01 - D. E. Veloper
{
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate();
            
            begin
                rec.TestField("Unit Cost");    
            end;
        }
        field(12345701;"CSD Resource Type";Option)
        {
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
            DataClassification = ToBeClassified;
        }
        field(12345702;"CSD Maximum Participants";Integer)
        {
            Caption = 'CSD Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(12345703;"CSD Quantity Per Day";Decimal)
        {
            Caption = 'CSD Quantity Per Day';
            DataClassification = ToBeClassified;
        }
    }
   
  
}