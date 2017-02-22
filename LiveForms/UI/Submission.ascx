<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Submission.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Submission" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Mandeeps.Web" Namespace="Mandeeps.Web.UI.WebControls" TagPrefix="Mandeeps" %>
<style type="text/css">

    .ui-dialog {
	overflow: hidden;
	position: absolute;
	top: 0;
	left: 0;
	padding: .2em;
	outline: 0;
}

    .dnnEditState .DnnModule {
    opacity: 1;
    -webkit-opacity: 1;
    -moz-opacity: 1;
}

    .ui-dialog .ui-dialog-titlebar {
        padding: .4em 1em;
        position: relative;
        
    }

    .mbutton.select-all{
        float:left;
    }
.ui-dialog .ui-dialog-title { float: left; margin: .1em 16px .1em 0; } 
.ui-dialog .ui-dialog-titlebar-close {background: none !important;border: 0 none !important;height: 18px !important;margin: -10px 0 0 !important;padding:0;position: absolute !important;right: 0.3em !important;top: 50% !important;width: 19px !important;}
.ui-dialog .ui-dialog-titlebar-close span { display: block; margin: 1px; }
.ui-dialog .ui-dialog-titlebar-close:hover, .ui-dialog .ui-dialog-titlebar-close:focus { padding: 0; }
.ui-dialog .ui-dialog-content { position: relative; border: 0; padding: 5px; background: none; overflow: auto; zoom: 1; }
.ui-dialog .ui-dialog-buttonpane { text-align: left; border-width: 1px 0 0 0; background-image: none; margin: .5em 0 0 0; padding: .3em 1em .5em .4em; }
.ui-dialog .ui-dialog-buttonpane .ui-dialog-buttonset { float: right; }
.ui-dialog .ui-dialog-buttonpane button { margin: .5em .4em .5em 0; cursor: pointer; }
.ui-dialog .ui-resizable-se { width: 14px; height: 14px; right: 3px; bottom: 3px; }
.ui-widget-header { border: 1px solid #aaaaaa; background: #cccccc url(images/ui-bg_highlight-soft_75_cccccc_1x100.png) 50% 50% repeat-x; color: #222222; font-weight: bold; }
.ui-icon { width: 16px; height: 16px; background-image: url(images/ui-icons_222222_256x240.png); }
.ui-widget-content .ui-icon {background-image: url(images/ui-icons_222222_256x240.png); }
.ui-icon-closethick { background-position: -96px -128px; }
.ui-widget-header .ui-icon {background-image: url(images/ui-icons_222222_256x240.png); }
.ui-resizable-handle {display: block; font-size: 0.1px; position: absolute; z-index: 99999;}
.ui-icon { display: block; text-indent: -99999px; overflow: hidden; background-repeat: no-repeat; }

</style>


<script type="text/javascript">
    function SubmissionRowClick(sender, eventArgs) {
        var grid = sender;
        var MasterTable = grid.get_masterTableView();
        var row = MasterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];
        var content = "<table cellpadding=\"3\" cellspacing=\"3\" style=\"border:0; margin:10px;\">";
        for (i = 0; i < row._element.cells.length; i++) {
         var item = $(row._element.cells[i]).children().attr('type');

            if (row._element.cells[i].innerHTML != '&nbsp;' && item !='checkbox') {
                var Fieldguid = MasterTable._data._columnsData[i].UniqueName;
                var header = '';
                if (Fieldguid == 'CreatedOn') {
                    content += "<tr><td><b>Submitted On: </b><td><td>" + row._element.cells[i].innerHTML + "</td></tr>";
                }
                else if (Fieldguid == 'IPAddress') {
                    content += "<tr><td><b>IP Address: </b><td><td>" + row._element.cells[i].innerHTML + "</td></tr>";
                }
                else {
                    content += "<tr><td><b>" + ArrayJsonField[Fieldguid] + ": </b><td><td>" + row._element.cells[i].innerHTML + "</td></tr>";
                }
            }
        }
        content += "</table>";
        jQuery(content).dialog({ dialogClass: "LiveForm", width: 'auto', width: 'auto', modal: true });
    }
</script>
<div class="LiveForm">
    <asp:Literal runat="server" ID="lSubmissioninfo"></asp:Literal>
    <Mandeeps:TabStrip runat="server" ID="ManageForm" Theme="Settings" ThemePath="~/DesktopModules/LiveForms/Resources/Tabs"
        SelectedIndex="0">
        <Mandeeps:Tab ID="SubmissionTab" runat="server">
            <div style="text-align: right; margin-right: 22px;">
                <asp:LinkButton ID="bSelectAll" CssClass="mbutton select-all" resourcekey="SelectAll"
                            runat="server" OnClientClick="javascript:CheckAllSubmissions();return false;"></asp:LinkButton> &nbsp;
                <asp:LinkButton ID="bSubmissionDeleteSelected" CssClass="glyphicon glyphicon-trash" runat="server" OnClick="bSubmissionDeleteSelected_Click" ToolTip="Delete"></asp:LinkButton>&nbsp;
                <asp:LinkButton CssClass="glyphicon glyphicon-floppy-save" ID="lbExportToExcel" runat="server" ToolTip="Export" OnClick="bExportToExcel_Click"></asp:LinkButton><br />
            </div><br />
            <telerik:RadGrid ID="gvSubmission" runat="server" width="98%" height="500px" AllowPaging="True" PageSize="10" AllowSorting="True"
                AutoGenerateColumns="True" AllowAutomaticUpdates="True" AllowCustomPaging="True" AllowMultiRowSelection="True"
                OnItemDataBound="gvSubmission_ItemDataBound" OnColumnCreated="gvSubmission_OnColumnCreated" OnSortCommand="gvSubmission_OnSortCommand" OnNeedDataSource="gvSubmission_NeedDataSource">
                <mastertableview datakeynames="SubmissionID" nomasterrecordstext="No Submission Record!">
                    <Columns>
                     <telerik:GridTemplateColumn UniqueName="cbSubmission">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbSubmission" runat="server" OnCheckedChanged="cbSubmission_Checked" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                        </Columns>
                </mastertableview>
               
                   
                   
                <clientsettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                <ClientEvents OnRowClick="SubmissionRowClick" />
            </clientsettings>
            </telerik:RadGrid>
        </Mandeeps:Tab>
        <Mandeeps:Tab ID="DesignerTab" runat="server">
        </Mandeeps:Tab>
    </Mandeeps:TabStrip>
</div>
