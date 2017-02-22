<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailAlert.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Controls.EmailAlert" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<style type="text/css">
    td > .dnnTooltip label {
        text-align: left;
    }
</style>
<div class="LiveForm">
    <asp:Panel ID="pnlEmailWizard" runat="server">
        <asp:Label runat="server" CssClass="caption" ResourceKey="linfobar"></asp:Label>
        <table>
            <tr>
                <td>
                    <dnn:Label ID="lblnotifydesc" runat="server" Text=""></dnn:Label></td>
                <td>
                    <asp:RadioButton ID="rbemail_notification" resourcekey="rbemail_notification" runat="server" Text="" Checked="true" GroupName="EmailAlert" Font-Bold="true" /></td>
            </tr>
            <tr>
                <td>
                    <dnn:Label ID="lblautoresponddesc" runat="server" Text=""></dnn:Label></td>
                <td>
                    <asp:RadioButton ID="rbemail_autorespond" resourcekey="rbemail_autorespond" runat="server" Text="" GroupName="EmailAlert" Font-Bold="true" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnEmailWizardNext" resourcekey="btnEmailWizardNext" CssClass="mbutton" runat="server" Text="" OnClick="btnEmailWizardNext_Click" /></td>
                <td></td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlDetails" CssClass="pnlDetails" runat="server" Visible="false">
        <table>
            <tr>
                <td>
                    <dnn:Label ID="lblAlertName" runat="server" Suffix=":" Text=""></dnn:Label></td>
                <td>
                    <asp:TextBox ID="tbEmailType" runat="server"></asp:TextBox>
                </td>
            </tr>
            <%--    <tr>
                <td>
                    <dnn:Label ID="lblSenderName" runat="server" Suffix=":" Text=""></dnn:Label></td>
                <td>
                    <select id="ddlSenderName" runat="server" class="SenderName">
                    </select>
                    <asp:TextBox ID="tbSenderName" runat="server"></asp:TextBox>
                </td>
            </tr>--%>
            <tr>
                <td>
                    <dnn:Label ID="lblSenderEmail" runat="server" Suffix=":" Text=""></dnn:Label></td>
                <td>
                    <select id="ddlSenderEmail" runat="server" style="width: 181px;" class="SenderEmail">
                    </select>
                    <asp:TextBox ID="txtSenderEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dnn:Label ID="lblRecipient" runat="server" Suffix=":" Text=""></dnn:Label></td>
                <td>
                    <select id="ddlRecipient" runat="server" style="width: 181px;" class="RecipientEmail">
                    </select>
                    <asp:TextBox ID="tbRecipient" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>


                <td>

                    <asp:Button ID="btnNext" CssClass="mbutton" resourcekey="btnNext" runat="server" Text="" OnClick="btnNext_Click" />
                    <asp:Button ID="btnBack" CssClass="mbutton2" resourcekey="btnBack" runat="server" Text="" OnClick="btnBack_Click" />
                </td>
                <td></td>
            </tr>
        </table>


    </asp:Panel>
    <asp:Panel ID="pnlComposeEmail" runat="server" Visible="false">
        <table width="100%">
            <tr>
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
                <td>
                    <asp:TextBox ID="tbSubject" runat="server" placeholder="Subject" Width="99%"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <dnn:TextEditor ID="tbContent" runat="server" width="100%" height="300px" class="tbEditor"></dnn:TextEditor>
                </td>
            </tr>
        </table>

        <asp:Button ID="btnFinish" CssClass="mbutton" resourcekey="btnFinish" runat="server" Text="" OnClick="btnFinish_Click" />
        <asp:Button ID="btnComposeBack" CssClass="mbutton2" resourcekey="btnComposeBack" runat="server" Text="" OnClick="btnComposeBack_Click" />
    </asp:Panel>
</div>
