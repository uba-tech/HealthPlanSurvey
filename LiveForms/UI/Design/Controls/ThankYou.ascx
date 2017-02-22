<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Controls.ThankYou" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<div class="LiveForm">
    <asp:Label runat="server" CssClass="caption" ResourceKey="linfobar"></asp:Label>
    <br />
     <div class="personalize">
        <span>Personalization</span>
        <asp:DropDownList ID="ddlTokens" AppendDataBoundItems="true" CssClass="FormsTokens" runat="server">
            <asp:ListItem Text="<Insert Token>" Value="SelectedToken"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <dnn:TextEditor ID="tbContent" CssClass="tbContent"  runat="server" width="100%" height="400px">
   </dnn:TextEditor>
    <div><asp:Label ID="Noteinfo" runat="server" Resourcekey="lNoteInfo" /></div>
    <br />
    <br />
<asp:LinkButton ID="bSave" Text="Save" resourcekey="bSave" CssClass="mbutton" runat="server" OnClick="bSave_Click"></asp:LinkButton>
<asp:LinkButton ID="bCancel"  resourcekey="bCancel" CssClass="mbutton2" Text="Cancel" runat="server" OnClick="bCancel_Click"></asp:LinkButton>
</div>
