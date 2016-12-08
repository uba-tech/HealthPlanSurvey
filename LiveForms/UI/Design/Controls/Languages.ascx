<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Languages.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Controls.Languages" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="LiveForm">
<asp:Label runat="server" CssClass="caption" ResourceKey="linfobar"></asp:Label>
<table class="Languages" id="option_languages">
    <tr>
        <td style="width: 204px">
            <dnn:Label ID="llanguage" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlLanguages" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlLanguages_SelectedIndexChanged"></asp:DropDownList>
            <asp:LinkButton runat="server" ID="bLocalized" Text="Localize List Values" ResourceKey="bLocalized" class="mbutton" OnClick="bLocalized_Click"></asp:LinkButton>
        </td>
    </tr>
</table>
<hr />
<table class="Field" id="option_Field" width="100%">
    <tr>
        <td>
            <div id="accordion">
                <asp:PlaceHolder ID="Language" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:LinkButton ID="bSaveLocalization" runat="server" class="mbutton" Text="Update" OnClick="bSave_Click"> </asp:LinkButton>
            &nbsp;&nbsp;
            <asp:LinkButton ID="bCancel" class="mbutton2" runat="server" Text="Cancel" OnClick="bCancel_Click" ></asp:LinkButton>
        </td>
    </tr>
</table>
</div>