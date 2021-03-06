pageextension 123456700 "CSD ResourceCardExt" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }

            field("CSD Quantity Per Day"; "CSD Quantity Per Day")
            {

            }
        }
        addafter("Personal Data")
        {
            group("Room")
            {
                Visible = showmaxfield;
                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {

                }
            }
        }

    }


    trigger OnAfterGetRecord();

    begin
        ShowmaxField := (Type = type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowmaxField: Boolean;
}