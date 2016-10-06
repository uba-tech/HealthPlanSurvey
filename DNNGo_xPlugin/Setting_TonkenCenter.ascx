<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_TonkenCenter.ascx.cs" Inherits="DNNGo.Modules.xPlugin.Setting_TonkenCenter" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

 <script type="text/javascript">
     var tb_pathToImage = "<%=ModulePath %>Resource/images/loadingAnimation.gif";
 </script>
<asp:Panel ID="plLicense" runat="server">
<asp:Literal ID="liDisplayAdmin" runat="server"></asp:Literal>
<asp:PlaceHolder ID="phScript" runat="server"></asp:PlaceHolder>
<div id="mo_wrapper" class="validationEngineContainer form_div_<%=ModuleId %>">
    <div id="mo_head" class="clearfix displayadmin">
        <div class="mo_title">
            <asp:Literal ID="litModuleTitle" runat="server"></asp:Literal>
            <asp:Literal ID="litModuleVersion" runat="server"></asp:Literal>
            <asp:Literal ID="litUpdateVersion" runat="server"></asp:Literal>
            </div>
        <div class="mo_author">
            <asp:Literal ID="litLicense" runat="server"></asp:Literal>
            <asp:Label ID="lblVersionBy" runat="server" Text="version by" resourcekey="lblVersionBy"></asp:Label><a href="http://www.DNNGo.net" target="_blank">DNNGo.net</a></div>
    </div>
    <div id="mo_info">
        <span class="back">
            <asp:LinkButton ID="lbBack" runat="server" OnClick="lbBack_Click" CausesValidation="false">
                <asp:Label ID="lblBack" runat="server" Text="Back" resourcekey="lblBack"></asp:Label></asp:LinkButton>
                </span>
        <ul class="help_link displayadmin"  runat="server" id="help_link">
            <li class="buyit"><a target="_blank" href="http://www.dnngo.net/DNNStore/tabid/58/ProductID/447/Default.aspx">
                <asp:Label ID="lblBuyIt" runat="server" resourcekey="lblBuyIt">Buy It</asp:Label></a></li>
            <li class="document"><a target="_blank" href="http://www.dnngo.net/doc/xPlugin/index.html">
                <asp:Label ID="Label2" runat="server" resourcekey="lblDocumentation">Documentation</asp:Label></a> </li>
            <li class="contactus"><a target="_blank" href="http://www.DNNGo.net/Contactus.aspx">
                <asp:Label ID="Label4" runat="server" resourcekey="lblContactUs">Contact Us</asp:Label></a> </li>
            <li class="help"><a target="_blank" href="http://www.DNNGo.net/Contactus/OnlineSupportTicket.aspx">
                <asp:Label ID="Label5" runat="server" resourcekey="lblHelp">Help</asp:Label></a> </li>
        </ul>
    </div>
    <asp:Label ID="lblMessage"  runat="server" CssClass="LI_Message"></asp:Label>
    <div id="mo_content">
        <div id="contact_tabs">
            <ul class="tabs_nav clearfix">
                <asp:Literal ID="LiJqueryTabs"   runat="server"></asp:Literal>
            </ul>
             <asp:Repeater ID="rpJqueryPanels" runat="server" OnItemDataBound="rpJqueryPanels_OnItemDataBound">
                <ItemTemplate>
                    <asp:Literal ID="LiContainer" runat="server"></asp:Literal>
                   <%-- <div id="tabs-<%#(Container.ItemIndex +1) %>" class="ui-tabs-panel ui-widget-content ui-corner-bottom">--%>
                        <div class="mod_container">
                            <asp:PlaceHolder  ID="phContainer" runat="server"></asp:PlaceHolder>
                        </div>
                     <asp:Literal ID="LiContainerEnd" runat="server" Text="</div>"></asp:Literal>
                </ItemTemplate>
             </asp:Repeater>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(function (q) {
        q("h3[class='hndle']").each(function (i, n) {
            q(this).click(function () { q(this).parent().find("div[class='inside']").slideToggle("normal"); });
        });
        q(".form_div_<%=ModuleId %>").validationEngine({
            promptPosition: "topRight"
        });

        q(".form_div_<%=ModuleId %> input[lang='Submit']").click(function () {
            if (!$('.form_div_<%=ModuleId %>').validationEngine('validate')) {
                return false;
            } 
        });

    });
    function CancelValidation() {
        jQuery('#Form').validationEngine('detach');
    }
</script>
</asp:Panel>
<asp:Panel ID="pnlTrial" runat="server">
    <center>
        <asp:Literal ID="litTrial" runat="server"></asp:Literal>
        <br />
        <asp:Label ID="lblMessages" runat="server" CssClass="SubHead" resourcekey="lblMessages"
            Visible="false" ForeColor="Red"></asp:Label>
    </center>
</asp:Panel>


 