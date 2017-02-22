<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddRole.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.DNN.AddRole" %>
<%@ Register Assembly="Mandeeps.Web" Namespace="Mandeeps.Web.UI.WebControls" TagPrefix="Mandeeps" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/Labelcontrol.ascx" %>
<%@ Register TagPrefix="LF" TagName="ConditionControl" Src="../Conditions.ascx" %>
<div class="LiveForm">
<div class="caption">
    <asp:Label ID="lActionInfo" runat="server" Resourcekey="lActionInfo" />
</div>
<table width="100%">
    <tr>
        <td width="150px">
            <dnn:Label runat="server" ResourceKey="lSecurityRoles" Text="Security Role" />
        </td>
        <td>
            <asp:DropDownList runat="server" ID="ddlSecurityRole" Width="212px" style="box-sizing: border-box;"></asp:DropDownList></td>
    </tr>
    <tr>
        <td>
            <dnn:Label runat="server" ResourceKey="lEffectiveDate" Text="Effective Date" />
        </td>
        <td>
            <asp:TextBox runat="server" ID="tbEffectiveDate" Width="200px"></asp:TextBox>
            <Mandeeps:DatePicker runat="server" ID="dpEffectiveDate" LinkTheme="false"></Mandeeps:DatePicker></td>
    </tr>
    <tr>
        <td>
            <dnn:Label runat="server" ResourceKey="lExpiryDate" Text="Expiry Date" />
        </td>
        <td>
            <asp:TextBox runat="server" ID="tbExpiryDate" Width="200px"></asp:TextBox>
            <Mandeeps:DatePicker runat="server" ID="dpExpiryDate" LinkTheme="false"></Mandeeps:DatePicker></td>

    </tr>
    <tr>
        <td colspan="2">
            <br />
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
</div>
