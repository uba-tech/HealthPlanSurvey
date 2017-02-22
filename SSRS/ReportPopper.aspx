<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReportPopper.aspx.vb" Inherits="BS.Modules.SSRS.ReportPopper" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script type="text/javascript">

            function pageLoad() {
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
                jQuery('div[id*="ReportViewer2"]').first().height("auto");
            }

    
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager2" runat="server" />
        <rsweb:ReportViewer ID="ReportViewer2" runat="server" ProcessingMode="Remote" Width="100%" ShowCredentialPrompts="False" SizeToReportContent="True" BackColor="White" InternalBorderStyle="NotSet" EnableTheming="False" ShowPromptAreaButton="True" ShowParameterPrompts="True" PromptAreaCollapsed="False" ShowToolBar="True" DocumentMapWidth="25%">
        </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
