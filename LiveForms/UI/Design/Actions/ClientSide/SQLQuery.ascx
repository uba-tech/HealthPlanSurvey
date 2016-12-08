<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SQLQuery.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.ClientSide.SQLQuery" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/Labelcontrol.ascx" %>
<%@ Register TagPrefix="LF" TagName="ConditionControl" Src="../Conditions.ascx" %>
<div class="LiveForm">
    
    <table style="float: right">
        <tr>
            <td>
                <dnn:Label runat="server" ResourceKey="lActionName" />
            </td>
            <td>
                <asp:TextBox runat="server" class="sfcommon" EnableViewState="true" ID="tbActionName"></asp:TextBox>
            </td>
        </tr>
    </table>
        <div style="clear: both;"></div>
<div class="caption">
    <asp:Label ID="lActionInfo" runat="server" Resourcekey="lActionInfo" />
</div>
<div>
    <table style="background-color: lightgray; padding: 8px; width: 100%; margin-bottom:10px;">

        <tr>
            <td style="width: 16%;">
                <asp:Label ID="lSQL" runat="server" resourcekey="lSQL"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlSQL" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 150px; vertical-align: top;">
                <dnn:label id="lSQLConnection" runat="server" Text="SQL Connection" />
            </td>
            <td>
                <asp:DropDownList ID="ddlSQLConnection" Style="width: 225px;" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <div class="personalize">
                    <span>Personalization</span>
                    <asp:DropDownList ID="ddlTokens" AppendDataBoundItems="true" CssClass="FormsTokens" runat="server">
                    </asp:DropDownList>
                </div>
            </td>
        </tr>
        <tr>
            <td style="width: 150px; vertical-align: top;">
                <dnn:label id="lSQLquery" runat="server" helptext="Specify SQLquery" Text="SQL Query" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="tbSQLquery" CssClass="SQLQuery" Visible="true" runat="server" Style="width: 100%; box-sizing: border-box; height: 250px;" Rows="9" TextMode="MultiLine"></asp:TextBox>
                <div><asp:Label ID="Noteinfo" runat="server" Resourcekey="lNoteInfo" /></div>
            </td>
        </tr>
    </table>

</div>
<div class="caption">
    <asp:Label ID="lConditionInfo" runat="server" Resourcekey="lConditionInfo" />
</div>
<table style="width: 100%;">
    <tr>
        <td>
        <LF:conditioncontrol id="CConditionSet" runat="server"></LF:conditioncontrol>
       </td>
   </tr>
    <tr>
        <td>
            <asp:LinkButton ID="bUpdate" runat="server" CssClass="mbutton" OnClientClick="return Conditions.IsValid('bSave');" OnClick="bUpdate_Click"></asp:LinkButton>
           <asp:LinkButton ID="bCancel" Text="Back" CssClass="mbutton2" ResourceKey="bCancel" runat="server" OnClick="bCancel_Click"></asp:LinkButton>
            </td>
    </tr>
</table>
</div>