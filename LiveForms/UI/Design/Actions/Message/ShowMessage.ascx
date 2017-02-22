<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShowMessage.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.ShowMessage" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="LF" TagName="ConditionControl" Src="../Conditions.ascx" %>
<div class="LiveForm">
<div class="caption">
    <asp:Label ID="lActionInfo" runat="server" Resourcekey="lActionInfo" />
</div>
    <div class="personalize">
        <span>Personalization</span>
        <asp:DropDownList ID="ddlTokens" AppendDataBoundItems="true" CssClass="FormsTokens" runat="server">
            <asp:ListItem Text="<Insert Token>" Value="SelectedToken"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <dnn:TextEditor ID="tbMessage" CssClass="tbMessage" runat="server" width="100%" height="400px">
    </dnn:TextEditor>    
    <div><asp:Label ID="Noteinfo" runat="server" Resourcekey="lNoteInfo" /></div>
    <br />
    <br />
    <div class="caption">
        <asp:Label ID="lConditionInfo" runat="server" Resourcekey="lConditionInfo" />
    </div>
    <table width="100%">
        <tr>
        <td colspan="2">
    <LF:ConditionControl ID="CConditionSet" runat="server"></LF:ConditionControl>
            </td>
    </tr>
    <tr>
        <td colspan="2">
    <asp:LinkButton ID="bSave" runat="server" CssClass="mbutton" OnClientClick="return Conditions.IsValid('bSave');" OnClick="bSave_Click"></asp:LinkButton>
    <asp:LinkButton ID="bCancel" Text="Back" CssClass="mbutton2" ResourceKey="bCancel" runat="server" OnClick="bBack_Click"></asp:LinkButton>
   </td>
    </tr>
</table>
</div>
