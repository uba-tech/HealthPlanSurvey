<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.DNN.Login" %>
<%@ Register Assembly="Mandeeps.Web" Namespace="Mandeeps.Web.UI.WebControls" TagPrefix="Mandeeps" %>
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
    <asp:Label ID="lLoginInfo" runat="server" Resourcekey="lLoginInfo" />
</div>
<table width="100%">
    <tr>
        <td width="150px">
            <dnn:Label runat="server" ResourceKey="lUsername" Text="Username" />
        </td>
        <td>
           <asp:DropDownList runat="server" ID="ddlUsernameFields" Width="212px"></asp:DropDownList></td>
    </tr>
    <tr>
        <td>
           <dnn:Label runat="server" ResourceKey="lPassword" Text="Password" />
        </td>
        <td>  
            <asp:DropDownList runat="server" ID="ddlPasswordFields" Width="212px"></asp:DropDownList></td>

        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label runat="server" ResourceKey="lRememberLogin" Text="Remember Login" />
        </td>
        <td>
             <asp:DropDownList runat="server" ID="ddlRememberFields" Width="212px"></asp:DropDownList></td>

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
            <asp:LinkButton ID="bSave" CssClass="mbutton" runat="server" OnClientClick="return Conditions.IsValid('bSave');" OnClick="bSave_Click"></asp:LinkButton>
             <asp:LinkButton ID="bCancel" Text="" CssClass="mbutton2" ResourceKey="bCancel" runat="server" OnClick="bBack_Click"></asp:LinkButton>
        </td>
     
    </tr>
</table>
</div>
