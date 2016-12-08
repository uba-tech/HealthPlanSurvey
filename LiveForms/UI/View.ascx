<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.View" %>
<%@ Register TagPrefix="dnn" TagName="Profile" Src="~/DesktopModules/LiveForms/UI/UserControls/DNNProfile.ascx" %>
<asp:Literal ID="lt" runat="server"></asp:Literal>
<asp:PlaceHolder ID="MessagePlaceholderTop" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="PHProfile" runat="server" Visible="false">
    <asp:HiddenField ID="HFProfileModuleID" runat="server" />
    <dnn:Profile  runat="server" ID="ctlProfile"/>
</asp:PlaceHolder>
<asp:PlaceHolder ID="FormPlaceholder" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="MessagePlaceholderBottom" runat="server"></asp:PlaceHolder>
