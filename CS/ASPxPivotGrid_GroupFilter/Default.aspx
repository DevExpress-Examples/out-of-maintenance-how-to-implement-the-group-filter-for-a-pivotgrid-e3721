<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="ASPxPivotGrid_GroupFilter._Default" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0,
    Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v15.1, Version=15.1.15.0,
    Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid"
    TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
        <title>Untitled Page</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <dx:ASPxLabel runat="server" Text="Filter Condition:"/>
            </div>
            <div style="margin-bottom:5px;">
                <dx:ASPxRadioButtonList ID="ASPxRadioButtonList1" runat="server" AutoPostBack="true"
                    onselectedindexchanged="ASPxRadioButtonList1_SelectedIndexChanged"
                    Border-BorderStyle="None">
                    <Items>
                        <dx:ListEditItem Text="Show all data" Value="0" Selected="true"/>
                        <dx:ListEditItem Text="Show December 2014 and January 2015 only" Value="1"/>
                        <dx:ListEditItem Text="Hide 2014 year" Value="2"/>
                        <dx:ListEditItem Text="Show first month days only" Value="3"/>
                    </Items>
                </dx:ASPxRadioButtonList>
            </div>
            <div>
                <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" Width="800px"
                    DataSourceID="AccessDataSource1">
                    <Fields>
                        <dx:PivotGridField ID="fieldShippedYear" Area="ColumnArea" AreaIndex="0" 
                            Caption="Year" FieldName="ShippedDate" GroupInterval="DateYear"
                            GroupIndex="0" InnerGroupIndex="0" UnboundFieldName="fieldShippedYear"/>
                        <dx:PivotGridField ID="fieldProductSales" Area="DataArea" AreaIndex="0" 
                            Caption="Sales" FieldName="ProductSales"/>
                        <dx:PivotGridField ID="fieldCategoryName" Area="RowArea" AreaIndex="0"
                            Caption="Category Name" FieldName="CategoryName"/>
                        <dx:PivotGridField ID="fieldShippedMonth" Area="ColumnArea" AreaIndex="2" 
                            Caption="Month" FieldName="ShippedDate" GroupInterval="DateMonth"
                            GroupIndex="0" InnerGroupIndex="1" UnboundFieldName="fieldShippedMonth"/>
                        <dx:PivotGridField ID="fieldShippedDay" Area="ColumnArea" AreaIndex="1"
                            Caption="Day" FieldName="ShippedDate" GroupInterval="DateDay" 
                            GroupIndex="0" InnerGroupIndex="2"/>
                    </Fields>
                    <Groups>
                        <dx:PivotGridWebGroup Caption="Date" />
                    </Groups>
                    <OptionsView ShowHorizontalScrollBar="True"/>
                </dx:ASPxPivotGrid>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/nwind.mdb"
                    SelectCommand="SELECT [CategoryName], [ProductName], [ProductSales],
                    [ShippedDate] FROM [ProductReports]"/>
            </div>
        </form>
    </body>
</html>
