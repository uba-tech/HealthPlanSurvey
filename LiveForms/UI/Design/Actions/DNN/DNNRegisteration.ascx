<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DNNRegisteration.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.DNN.DNNRegisteration" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/Labelcontrol.ascx" %>
<%@ Register TagPrefix="LF" TagName="ConditionControl" Src="../Conditions.ascx" %>
<div class="LiveForm">
<div class="caption">
    <asp:Label ID="lActionInfo" runat="server" Resourcekey="lActionInfo" />
</div>
    <style type="text/css">
    hr {
        margin:0px;
    }

  
</style>
<table width="100%">
    <tr>
        <td colspan="2"><asp:Label ID="lRegistrationHeading" runat="server" ResourceKey="lRegistrationHeading" Font-Bold="true"></asp:Label><hr /></td>
    </tr>
    <tr>
        <td width="300px">
            <dnn:label ID="lEmail" runat="server" ResourceKey="lEmail" Font-Bold="true"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlEmails" runat="server" Width="250px"></asp:DropDownList>
        </td>
    </tr>
    
    <tr>
        <td width="300px">
            <dnn:label ID="lFirstname" runat="server" ResourceKey="lFirstname" Font-Bold="true"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlfname" runat="server" Width="250px"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td width="300px">
            <dnn:label ID="lLastname" runat="server" ResourceKey="lLastname" Font-Bold="true"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddllname" runat="server" Width="250px"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td width="300px">
            <dnn:label ID="lDisplayName" runat="server" ResourceKey="lDisplayName" Font-Bold="true"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddldName" runat="server" Width="250px"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td width="300px">
            <dnn:label ID="lUsername" runat="server" ResourceKey="lUsername" Font-Bold="true"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddluname" runat="server" Width="250px"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td width="300px">
            <dnn:label ID="lPassword" runat="server" ResourceKey="lPassword" Font-Bold="true"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlPassword" runat="server" Width="250px"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td width="300px">
            <dnn:label ID="lForceChangePassword" runat="server" ResourceKey="lForceChangePassword" Font-Bold="true"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="cbForceChangePassword" runat="server" />
        </td>
    </tr>
    <tr>
        <td width="300px">
            <dnn:label ID="lSendRegistrationEmail" runat="server" ResourceKey="lSendRegistrationEmail" Font-Bold="true"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="cbSendRegistrationEmail" Checked="true" runat="server" />
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2"><asp:Label ID="lProfileHeading" runat="server" ResourceKey="lProfileHeading" Font-Bold="true"></asp:Label><hr /></td>
    </tr>
    </table>
    <asp:PlaceHolder ID="ProfileOptions" runat="server">

    </asp:PlaceHolder>
    <table width="100%">
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
            <asp:LinkButton ID="bSave" Text="" CssClass="mbutton" runat="server" OnClientClick="return Conditions.IsValid('bSave');" OnClick="bSave_Click"></asp:LinkButton>
             <asp:LinkButton ID="bCancel" Text="" CssClass="mbutton2" ResourceKey="bCancel" runat="server" OnClick="bBack_Click"></asp:LinkButton>
         </td>
    </tr>
</table>
<br />
</div>