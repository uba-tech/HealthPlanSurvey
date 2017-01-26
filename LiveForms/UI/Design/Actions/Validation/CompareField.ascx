<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CompareField.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.Validation.CompareField" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="LF" TagName="ConditionControl" Src="../Conditions.ascx" %>
<style>
    .FieldAlign{
        display: inline-block;
    }
    

</style>
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
<div style="background-color: lightgray; padding: 8px; width: 100%; ">

   <div class="FieldAlign"><span>IF</span> <asp:DropDownList ID="ddlFirstField" runat="server" AutoPostBack="true" onselectedindexchanged="ddlFirstField_SelectedIndexChanged" ></asp:DropDownList></div>
    <div class="FieldAlign"><asp:DropDownList Visible="false" ID="ddlFilterConditions" runat="server"></asp:DropDownList></div>
   <div class="FieldAlign"><asp:DropDownList ID="ddlSecondField" runat="server" AutoPostBack="true" onselectedindexchanged="ddlSecondField_SelectedIndexChanged"></asp:DropDownList></div>



</div>
<div style="background-color: lightgray; padding: 8px;margin-bottom:10px;">
 <div class="FieldAlign"><span>THEN Show Message</span></div>
</div>
    <div padding: 8px;>
        <dnn:TextEditor ID="tbMessage" CssClass="tbMessage" runat="server" width="100%" height="400px">
                  </dnn:TextEditor>
    </div>
        
<div class="caption">
    <asp:Label ID="lConditionInfo" runat="server" Resourcekey="lConditionInfo" />
</div>
<table style="width: 100%;">
    <tr>
    <td>
         <LF:conditioncontrol id="CConditionSet" runat="server"></LF:conditioncontrol>
    </td> 
    </tr>
    <tr>
        <td>
           <asp:LinkButton ID="bSave" CssClass="mbutton" runat="server" OnClientClick="return Conditions.IsValid('bSave');" OnClick="bSave_Click"></asp:LinkButton>
           <asp:LinkButton ID="bCancel" Text="Back" CssClass="mbutton2" ResourceKey="bCancel" runat="server" OnClick="bBack_Click"></asp:LinkButton>
        </td>
    </tr>
</table>
</div>