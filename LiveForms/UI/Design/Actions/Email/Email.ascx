<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Email.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.Email.Email" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/Labelcontrol.ascx" %>
<%@ Register TagPrefix="LF" TagName="ConditionControl" Src="../Conditions.ascx" %>
<div class="LiveForm">
<div class="caption">
    <asp:Label ID="lActionInfo" runat="server" Resourcekey="lActionInfo" />
</div>
<style type="text/css">
    .dnnTooltip label {
        text-align: left;
    }
    .LiveForm .personalize{
        margin-right: 0px;
    }
  
</style>
<%--<script>
    var elem;
    var token;
    $("body").delegate(".focused", "focusout", function () {
        elem = $(this);
    });
    $(document).ready(function () {
        $(".FormsTokens").change(function () {
            token = $(".FormsTokens :selected").val();
            if (token != "SelectedToken")
                SetToken();
        });
    });

    function SetToken() {
        if (typeof elem != 'undefined' && typeof token != 'undefined') {
            $(elem).val(($(elem).val()) + " " + token);
            elem = undefined;
            token = undefined;
        }
        else if (typeof token != 'undefined' && typeof elem == 'undefined') {
            var Selector = jQuery('.LiveForm iframe').contents().find('iframe').contents().find('body');
            if (Selector.length <= 0)
                Selector = jQuery('.LiveForm').contents().find('iframe').contents().find('body');
            Selector.append(token);

        }
    }
</script>--%>
<table width="100%" class="LiveForm">
    <tr>
        <td colspan="2">
            
        </td>
    </tr>
    <tr>
        <td width="150px">
            <dnn:Label ID="lToEmail" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="tbToEmail" CssClass="focused" runat="server" Width="250px"></asp:TextBox>
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
        <td>
            <dnn:Label ID="lSubject" runat="server" Text=""></dnn:Label>
        </td>
        <td colspan="2">
            <asp:TextBox ID="tbSubject" CssClass="focused" runat="server" Width="250px"></asp:TextBox>
        </td> 
    </tr>
  
    <%--<tr>
        <td>
            <dnn:Label ID="lFromName" runat="server" Text=""></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="tbFromName" runat="server" CssClass="focused" Width="250px"></asp:TextBox>
        </td>
    </tr>--%>
 
    <tr>
        <td>
            <dnn:Label ID="lFromEmail" runat="server" Text=""></dnn:Label>
        </td>
        <td colspan="2">
            <asp:TextBox ID="tbFromEmail" runat="server" CssClass="focused" Width="250px"></asp:TextBox>
        </td>
    </tr>
  
    <tr>
        <td>
            <dnn:Label ID="lBody" runat="server" Text=""></dnn:Label>
        </td>
        <td colspan="2">
            <dnn:TextEditor ID="tbBody" runat="server" CssClass="focused" width="100%" height="300px">
            </dnn:TextEditor>
            <div><asp:Label ID="Noteinfo" runat="server" Resourcekey="lNoteInfo" /></div>
        </td>
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
            <asp:LinkButton ID="bUpdate" runat="server" CssClass="mbutton" OnClientClick="return Conditions.IsValid('bSave');" OnClick="bUpdate_Click"></asp:LinkButton>
           <asp:LinkButton ID="bCancel" Text="Back" CssClass="mbutton2" ResourceKey="bCancel" runat="server" OnClick="bBack_Click"></asp:LinkButton>
         </td>
    </tr>
</table>
</div>
