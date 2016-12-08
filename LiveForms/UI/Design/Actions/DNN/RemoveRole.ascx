<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RemoveRole.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.DNN.RemoveRole" %>
<%@ Register TagPrefix="LF" TagName="ConditionsControl" Src="~/DesktopModules/LiveForms/UI/Design/Actions/Conditions.ascx" %>
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
<table width="100%">
    <tr>
        <td width="150px">
            <dnn:label ID="lSecurityRoles" runat="server" ResourceKey="lSecurityRoles" Font-Bold="true"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlSecurityRoles" runat="server" Width="250px"></asp:DropDownList>
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
<br />
</div>
