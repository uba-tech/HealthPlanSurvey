<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExecuteJScript.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.Script.ExecuteJScript" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/Labelcontrol.ascx" %>
<%@ Register TagPrefix="LF" TagName="ConditionControl" Src="../Conditions.ascx" %>
<div class="LiveForm">
<div class="caption">
    <asp:Label ID="lActionInfo" runat="server" Resourcekey="lActionInfo" />
</div>
<table style="width: 100%">
    <tr>

        <td colspan="2">
            <div class="personalize">
                <span>Personalization</span>
                <asp:DropDownList ID="ddlTokens" AppendDataBoundItems="true" CssClass="FormsTokens" runat="server">
                    <asp:ListItem Text="<Insert Token>" Value="SelectedToken"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top; width: 100px;">
            <dnn:Label ID="lScript" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="tbScript" CssClass="tbScript" Visible="true" runat="server" Style="width: 100%; box-sizing: border-box; height: 280px;" Rows="9" TextMode="MultiLine"></asp:TextBox>
            <div><asp:Label ID="Noteinfo" runat="server" Resourcekey="lNoteInfo" /></div>
        </td>
    </tr>
     <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <div class="caption">
                <asp:Label ID="lConditionInfo" runat="server" Resourcekey="lConditionInfo" />
            </div>
            <LF:ConditionControl ID="CConditionSet" runat="server"></LF:ConditionControl>
        </td>
    </tr>
    <tr>
       <td colspan="2">
            <asp:LinkButton ID="bUpdate" runat="server" CssClass="mbutton" OnClientClick="return Conditions.IsValid('bSave');" OnClick="bUpdate_Click"></asp:LinkButton>
            <asp:LinkButton ID="bCancel" Text="Back" CssClass="mbutton2" ResourceKey="bCancel" runat="server" OnClick="bBack_Click"></asp:LinkButton>
                   </td>
    </tr>
</table>
</div>

