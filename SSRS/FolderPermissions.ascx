<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="FolderPermissions.ascx.vb" Inherits="BS.Modules.SSRS.FolderPermissions" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>


<div class="dnnForm">
    
<asp:MultiView ID="mvPermissions" runat="server" ActiveViewIndex="0">
<asp:View ID="vwFolderPermissions" runat="server">

    <br />
    <div style="text-align:left">
    <div class="Head">Report Permissions</div>
    <div class="Normal">You can define permissions by DNN role to set which roles have access to which reports.  In order for report permissions defined here to be 
        used, the module must be setup to allow a user to select a report to view and then the permissions defined here will be used.  If no permissions are setup
        for a report, all users who have access to the module will be able to select the report to be viewed.  If one or more permissions are setup for a report, the 
        user must be in a role which has been granted access to view the report in order for it to show up in the selection list.</div>
    <br />
    </div>

    <asp:Label ID="lblMessage" ForeColor="Red" runat="server" Visible="false"></asp:Label>
    <br />

    <asp:table ID="tblSelectors" runat="server" cellspacing="0" cellpadding="2" border="0" summary="Report Settings">
      <asp:TableRow ID="TableRowa1" runat="server" >
        <asp:TableCell ID="TableCella1" runat="server" class="SubHead" width="180" >
          <dnn:label id="lblReportServer" runat="server" controlname="cmbReportServer" suffix=":"></dnn:label>
        </asp:TableCell>
        
        <asp:TableCell ID="TableCella2" runat="server" valign="top" >
            <asp:DropDownList ID="cmbReportServer" runat="server" AutoPostBack="True">
            </asp:DropDownList>
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow ID="TableRowa3" runat="server" >
        <asp:TableCell ID="TableCella5" runat="server" class="SubHead" width="180" >
            <dnn:label id="lblFolder" runat="server" controlname="cmbFolder" suffix=":"></dnn:label>
        </asp:TableCell>
        <asp:TableCell ID="TableCella6" runat="server" valign="top"  >
            <asp:DropDownList ID="cmbFolder" runat="server" AutoPostBack="True"></asp:DropDownList>
        </asp:TableCell>
      </asp:TableRow>

    </asp:table>

    <br />
    <asp:Table ID="tblReports" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" GridLines="Both" CellPadding="2" CellSpacing="0" CssClass="Normal">
        <asp:TableHeaderRow ID="thrHeader" runat="server">
          </asp:TableHeaderRow>
    </asp:Table>
    
    <br />
    <asp:LinkButton ID="btnDeleteFolderPermissions" runat="server" OnClick="btnDeleteFolderPermissions_Click" CausesValidation="true" CssClass="CommandButton"><img src="/images/action_delete.gif" alt="Delete" />Delete Permissions</asp:LinkButton>

    <div style="text-align:center">
        <br /><br />
        <asp:LinkButton ID="cmdBack" runat="server" CssClass="CommandButton"><img src="/images/lt.gif" alt="Cancel" />Back</asp:LinkButton>
    </div>
</asp:View>


<asp:View ID="vwReportPermissions" runat="server">
    <div>
        <asp:label class="SubHead" runat="server" ID="Label1" Font-Bold="True" Text="Item Type: "></asp:label><asp:label runat="server" ID="lblItemType" Font-Bold="True"></asp:label><br />
        <asp:label class="SubHead" runat="server" ID="Label2" Font-Bold="True" Text="Item Path: "></asp:label><asp:Label runat="server" ID="lblItemPath" Font-Bold="True"></asp:Label><br />
        <br />
        <div class="Normal">Select one or more roles which will have access to the selected Folder/Report.  By default, no selection indicates access to all roles.</div>
        <br />
        <div align="center">
            <asp:Repeater ID="rptRoles" runat="server">
                <HeaderTemplate>
                    <table align="center" border="1" cellspacing="0" cellpadding="0" >
                        <tr>
                            <td><b>Role Id</b></td>
                            <td><b>Role Name</b></td>
                            <td><b>Allow Access</b></td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><asp:Label ID="lblRoleId" runat="server" Visible="True" Text='<%# Bind("RoleId") %>'></asp:Label></td>
                         <td><asp:Label ID="lblRoleName" runat="server" Visible="True" Text='<%# Bind("RoleName") %>'></asp:Label></td>                    
                        <td align="center">
                            <asp:CheckBox ID="chkAllowView" runat="server" Checked='<%# Bind("AllowView") %>' />
                        </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <br />
        
            <asp:LinkButton ID="lnkSave" runat="server" CssClass="CommandButton"><img src="/images/save.gif" alt="Save" />Save</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="lnkCancel" runat="server" CssClass="CommandButton"><img src="/images/lt.gif" alt="Cancel" />Cancel</asp:LinkButton>

        </div>
    </div>
</asp:View>

</asp:MultiView>        
</div>
    