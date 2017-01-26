<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExecuteSQL.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.SQL.ExecuteSQL" %>
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
<br />
<table style="width: 100%">
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
                        <asp:ListItem Text="<Insert Token>" Value="SelectedToken"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </td>
        </tr>
        <tr>
            <td style="width: 150px; vertical-align: top;">
                <dnn:label id="lSQLquery" runat="server" helptext="Specify SQLquery" Text="SQL Query" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="tbSQLquery" CssClass="SQLQuery" Visible="true" runat="server" Style="width: 100%; box-sizing: border-box;  height: 250px;" Rows="9" TextMode="MultiLine"></asp:TextBox>
                <div><asp:Label ID="Noteinfo" runat="server" Resourcekey="lNoteInfo" /></div>
            </td>
        </tr>
     <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
         <td>&nbsp;</td>
    </tr>
        <tr>
            <td colspan="3">
                <div class="caption">
                    <asp:Label ID="lConditionInfo" runat="server" Resourcekey="lConditionInfo" />
                </div>
                <LF:ConditionControl ID="CConditionSet" runat="server"></LF:ConditionControl>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            <asp:LinkButton ID="bSave" runat="server" CssClass="mbutton" OnClientClick="return Conditions.IsValid('bSave');" OnClick="bSave_Click"></asp:LinkButton>
            <asp:LinkButton ID="bCancel" Text="Back" CssClass="mbutton2" ResourceKey="bCancel" runat="server" OnClick="bBack_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
</div>
