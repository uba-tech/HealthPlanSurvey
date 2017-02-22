<%@ Control language="vb" Inherits="BS.Modules.SSRS.View" AutoEventWireup="false" Explicit="True" Codebehind="View.ascx.vb" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<script type="text/javascript">
    jQuery(document).ready(fixCalendar);

    function fixCalendar() {
        var isIE11 = !!navigator.userAgent.match(/Trident\/7\./)
        if ((!jQuery.browser.msie) && (!isIE11)) {
            addDatePicker();
            jQuery('[id*="ReportViewer1_ReportViewer"]').bind('DOMNodeInserted', addDatePicker);
        }
    }

    function addDatePicker() {
        jQuery(jQuery(":hidden[id*='DatePickers']").val().split(",")).each(function (i, item) {
            var h = jQuery("table[id*='ParametersGrid'] span").filter(function (i) {
                var v = "[" + jQuery(this).text() + "]";
                return (v != null && v.indexOf(item) >= 0);
            }).parent().parent("td").next("td").find("div:has(input[type='text']):not(:has(input[type='image'])):not(:has(img))").each(function () {
                jQuery(this).children('input[type="text"]').attr("size", 27);
                jQuery(this).children('input[type="text"]').datepicker({
                    showOn: "button",
                    buttonImage: jQuery('[id*="ModulePath"]').val() + "images/calendar.gif",
                    buttonImageOnly: true,
                    showOtherMonths: false,
                    dateFormat: jQuery('[id*="DateFormat"]').val(),
                    defaultDate: jQuery.datepicker.parseDate(jQuery('[id*="DateFormat"]').val(), jQuery(this).children('input[type="text"]').val().split(' ')[0]),
                    showAnim: "slide",
                    showOptions: { direction: 'up' },
                    changeMonth: true,
                    changeYear: true
                });
            });
        });
    }
</script>
<script type="text/javascript">
    //this function is needed to fix the DNN styling for checkboxes and radio lists in dnn.jquery.js that jacks things up 
    (function () {
        jQuery(document).ready(function () {
            jQuery.fn.dnnCheckbox = function (options) { };
        });
    } ());

    jQuery(document).ready(RemoveDnnCheckboxFormat);

    function RemoveDnnCheckboxFormat() {
        jQuery('.dnnCheckbox').remove();
        jQuery(':checkbox').removeAttr('style');
    }    
</script>   
<script type="text/javascript">
    jQuery(document).ready(function () {
        setWindowSize();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    });

    jQuery(window).resize(function () {
        setWindowSize();
    });

    function EndRequestHandler(sender, args) {
        if (args.get_error() == undefined) {
            setWindowSize();
        }
        else {
            var errorMessage = args.get_error().message;
            args.set_errorHandled(true);

            //Do error handling here.
            alert("Error : " + errorMessage);
        }
    }

    function setWindowSize() {
        if (jQuery('[id*="SizeToReportContent"]').val() == "True") {
            jQuery('div[id*="ReportViewer1"]').first().height("auto");
        }
        else {
            parmRowHeight = jQuery('tr[id*="ParametersRowdnn"]').first().height();
            jQuery('div[id*="VisibleReportContentdnn"]').first().height(jQuery('[id*="Height"]').val() - parmRowHeight);
        }
    }
    
</script> 
<asp:Panel ID="LicensePanel" runat="server" Visible="false">
    <asp:Panel ID="LicensePanelActivateTrial" runat="server">
        <div style="text-align: left">Thank you for your interest in our products.  In order to activate the module, you need to either have purchased it or you can activate a fully functional trial for 30 days by entering your email below and clicking the &quot;Activate Trial&quot; button.</div>
        <table>
            <tr>
              <td>
                  <asp:Label ID="Label4" runat="server" Text="Your Email Address:" Width="150px"></asp:Label></td>
              <td>
                  <asp:TextBox ID="txtTrialEmailAddress" runat="server" Width="250px"></asp:TextBox></td>
              <td>
                  <asp:Button ID="cmdActivateTrial" runat="server" Text="Activate Trial" /></td>
            </tr>
        </table>
        <asp:Label ID="lblActivationStatusTrial" runat="server" ForeColor="Red" 
            Font-Bold="True"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="LicensePanelActivate" runat="server">
        <div style="text-align: left">If you have purchased the module or your license has expired, simply enter your new key below and click the &quot;Activate Key&quot; button.  If you have not received your key and purchased the product, please email <a href='mailto:service@modulemasters.com'>service@modulemasters.com</a> with your order details.  If you have not purchased the module and would like to do so, you can convert the trial over to the full working version by ordering directly from Snowcovered or you can order from <a href='http://modulemasters.com/Products/SQLReportingServices/tabid/216/Default.aspx' target='_blank'>ModuleMasters.com</a> and save 10%.</div>
             <table>
            <tr>
              <td>
                  <asp:Label ID="Label3" runat="server" Text="Activation Key:" Width="150px"></asp:Label></td>
              <td>
                  <asp:TextBox ID="txtActivationKey" runat="server" Width="250px"></asp:TextBox></td>
              <td>
                  <asp:Button ID="cmdActivate" runat="server" Text="Activate Key" /></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Panel>
<asp:Label ID="lblMessage" runat="server" style="text-align: left"></asp:Label>
<asp:Label Id="lblReportName" runat="Server" CssClass="Head" style="text-align: left"></asp:Label>
<asp:DropDownList ID="cmbReport" runat="server" AutoPostBack="true" visible="false"></asp:DropDownList>
<asp:Table id="tblNavigation" runat="server" BorderStyle="none">
    <asp:TableRow VerticalAlign="Middle">
        <asp:TableCell>
            <asp:HyperLink ID="lnkUp" runat="server" ToolTip="Up Directory">lnkUp</asp:HyperLink>
        </asp:TableCell>
        <asp:TableCell CssClass="SubHead">
                &nbsp;<asp:Label ID="lblItemPath" runat="server" Text="lblItemPath"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<asp:HyperLink ID="lnkNavigation" runat="server">lnkNavigation</asp:HyperLink>
<asp:Table ID="tblReports" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" GridLines="Both" CellPadding="2" CellSpacing="0" CssClass="Normal">
    <asp:TableHeaderRow ID="thrHeader" runat="server">
        <asp:TableHeaderCell ID="thdIcon" runat="server" ></asp:TableHeaderCell>
        <asp:TableHeaderCell ID="thdItem" runat="server" text="Item"></asp:TableHeaderCell>
        <asp:TableHeaderCell ID="thdDescription" runat="server" Text="Description"></asp:TableHeaderCell>
    </asp:TableHeaderRow>
</asp:Table>
<asp:UpdatePanel ID="updPanelReportViewer" runat="server" OnUnload="updPanelReportViewer_Unload">
    <ContentTemplate>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Remote" Width="100%" ShowCredentialPrompts="False" SizeToReportContent="True" BackColor="White" InternalBorderStyle="NotSet" EnableTheming="False" ShowPromptAreaButton="True" ShowParameterPrompts="True" PromptAreaCollapsed="False" ShowToolBar="True" DocumentMapWidth="25%" />
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:Label ID="lblActivationStatus" runat="server" ForeColor="Red"  Font-Bold="True" Visible="false"></asp:Label>
<asp:Panel ID="pnlLicenseQuicklinks" runat="server" Visible="false">
    <br />
    <asp:LinkButton ID="lnkForceActivation" runat="server" CssClass="CommandButton"  visible="True"><img src="/images/lock.gif" alt="Activate" />Activate Module</asp:LinkButton>&nbsp;
    <asp:HyperLink ID="lnkPurchaseModule" runat="server" CssClass="CommandButton"  Target="_blank" visible="True" NavigateUrl="http://modulemasters.com/Products/SQLReportingServices/tabid/216/Default.aspx"><img src="/images/lock.gif" alt="Purchase" />Purchase Module</asp:HyperLink>&nbsp;
</asp:Panel>
<asp:Panel ID="pnlModuleConfig" runat="server" Visible="false">
    <br />
    <asp:LinkButton ID="lnkModuleSettings" runat="server" CssClass="CommandButton" visible="True"><img src="/images/edit.gif" alt="Edit" />Module Configuration</asp:LinkButton>&nbsp;
    <asp:LinkButton ID="lnkServerAdministration" runat="server" CssClass="CommandButton"  visible="True"><img src="/images/edit.gif" alt="Edit" />Server Administration</asp:LinkButton>&nbsp;
    <asp:LinkButton ID="lnkReportPermissions" runat="server" CssClass="CommandButton" visible="True"><img src="/images/edit.gif" alt="Edit" />Report Permissions</asp:LinkButton>&nbsp;
</asp:Panel>
<asp:HiddenField ID="ModulePath" runat="server" />
<asp:HiddenField ID="DatePickers" runat="server" />
<asp:HiddenField ID="DateFormat" runat="server" />
<asp:HiddenField ID="SizeToReportContent" runat="server" />
<asp:HiddenField ID="Height" runat="server" />