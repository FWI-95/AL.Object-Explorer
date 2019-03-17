page 50100 "Object Explorer"
{
    Caption = 'Object Explorer';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Object;
    SourceTableView = sorting (Type) order(ascending);

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ID; ID)
                {
                    ApplicationArea = All;
                    Editable = false;

                }

                field(Name; Name)
                {
                    Editable = false;
                }

                field(Caption; Caption)
                {

                }
            }
        }
        area(FactBoxes)
        {
            part(ObjectListFactBox; "Object Explorer Fields Factbox")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Run)
            {
                Caption = 'Run Object';
                ApplicationArea = All;
                Image = Continue;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    case Type of
                        Type::Page:
                            PAGE.RUN(ID);
                        Type::Codeunit:
                            CODEUNIT.RUN(ID);
                        Type::Report:
                            REPORT.RUN(ID);
                        Type::XMLport:
                            XMLPORT.RUN(ID);
                        Type::Table:
                            HYPERLINK(GETURL(CLIENTTYPE::Current, COMPANYNAME, OBJECTTYPE::Table, ID));
                        Type::Query:
                            HYPERLINK(GETURL(CLIENTTYPE::Current, COMPANYNAME, OBJECTTYPE::Query, ID));
                    end;
                end;
            }
        }
        area(Navigation)
        {
            action(FieldList)
            {
                // RunObject = Page "Object Explorer Fields";
                Caption = 'Field List';
                Image = Line;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FieldList: Page "Object Explorer Fields";
                    FieldRec: Record "Field";
                begin
                    clear(FieldList);

                    if (Type = Type::Table) then begin
                        FieldRec.reset;
                        FieldRec.SetRange(TableNo, ID);
                        FieldList.SetTableView(FieldRec);
                    end;
                    FieldList.runmodal();
                end;
            }
            action(ClearFilter)
            {
                ApplicationArea = All;
                Image = ClearFilter;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    SetRange(Type);
                end;
            }
            action(FilterTable)
            {
                ApplicationArea = All;
                Image = FilterLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    SetRange(Type, Type::Table);
                end;
            }
            action(FilterPage)
            {
                ApplicationArea = All;
                Image = FilterLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    SetRange(Type, Type::Page);
                end;
            }
            action(FilterCodeunit)
            {
                ApplicationArea = All;
                Image = FilterLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    SetRange(Type, Type::Codeunit);
                end;
            }

            action(FilterXMLPort)
            {
                ApplicationArea = All;
                Image = FilterLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    SetRange(Type, Type::XMLport);
                end;
            }
            action(FilterReport)
            {
                ApplicationArea = All;
                Image = FilterLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    SetRange(Type, Type::Report);
                end;
            }
        }
    }
}
page 50101 "Object Explorer Fields"
{
    Caption = 'Field List';
    PageType = List;
    SourceTable = 2000000041;

    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TableNo; TableNo)
                {

                }
                field(TableName; TableName)
                {

                }
                field(FieldName; FieldName)
                {
                    ApplicationArea = All;
                }

                field("Field Caption"; "Field Caption")
                {
                    ApplicationArea = All;
                }

                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field(Len; Len)
                {

                }
                field(OptionString; OptionString)
                {

                }
            }
        }
    }
}

page 50102 "Object Explorer Fields Factbox"
{
    PageType = ListPart;
    SourceTable = 2000000041;

    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Field Caption"; "Field Caption")
                {
                    ApplicationArea = All;
                }

                field(Type; Type)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}