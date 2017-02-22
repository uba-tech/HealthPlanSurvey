<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ModuleSettings.ascx.vb" Inherits="BS.Modules.SSRS.ModuleSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<br />
<div style="text-align:left">
<div class="Head">Module Configuration</div>
<div class="Normal">Here you can configure the module instance. You first should configure at least one server in the Server Administration utility before setting up any instances of the module.</div>
<br />
</div>

<asp:table ID="Table1" runat="server" cellspacing="0" cellpadding="2" border="0" summary="Report Settings">

      <asp:TableRow ID="TableRowc1" runat="server" >
        <asp:TableCell ID="TableCell1" runat="server" class="SubHead" width="180" >
        <dnn:label id="lblReportServer" runat="server" controlname="cmbReportServer" suffix=":"></dnn:label></asp:TableCell>
        
        <asp:TableCell ID="TableCell2" runat="server" valign="top" >
            <asp:DropDownList ID="cmbReportServer" runat="server" AutoPostBack="True">
            </asp:DropDownList></asp:TableCell>
      </asp:TableRow>
      <asp:TableRow ID="TableRow2" runat="server" >
        <asp:TableCell ID="TableCell3" runat="server" class="SubHead" width="180"  ></asp:TableCell>
        <asp:TableCell ID="TableCell4" runat="server" valign="top"  >
            <asp:Label ID="lblMessage" ForeColor="Red" runat="server" Visible="false"></asp:Label></asp:TableCell>
      </asp:TableRow>      

      <asp:TableRow ID="TableRow3" runat="server" >
        <asp:TableCell ID="TableCell5" runat="server" class="SubHead" width="180" >
        <dnn:label id="lblFolder" runat="server" controlname="cmbFolder" suffix=":"></dnn:label></asp:TableCell>
        <asp:TableCell ID="TableCell6" runat="server" valign="top"  >
            <asp:DropDownList ID="cmbFolder" runat="server" AutoPostBack="True">
            </asp:DropDownList></asp:TableCell>
      </asp:TableRow>
     <asp:TableRow ID="TableRow4" runat="server" >
        <asp:TableCell ID="TableCell7" runat="server" class="SubHead" width="180"></asp:TableCell>
        <asp:TableCell ID="TableCell8" runat="server">
            <asp:CheckBox ID="chkAllowSelection" runat="server" Text="Allow User to Select Report" AutoPostBack="True" />
            </asp:TableCell>
      </asp:TableRow>
      <asp:TableRow ID="TableRow5" runat="server" >
        <asp:TableCell ID="TableCell9" runat="server" class="SubHead" width="180" ><dnn:label id="lblReport" runat="server" controlname="cmbReport" suffix=":"></dnn:label></asp:TableCell>
        <asp:TableCell ID="TableCell10" runat="server" valign="top" >
            <asp:DropDownList ID="cmbReport" runat="server">
            </asp:DropDownList></asp:TableCell>
        
    </asp:TableRow>
     <asp:TableRow ID="TableRow6" runat="server" >
        <asp:TableCell ID="TableCell11" runat="server" class="SubHead" width="180"></asp:TableCell>
        <asp:TableCell ID="TableCell12" runat="server" valign="middle">
            <asp:CheckBox ID="chkShowTableNavigation" runat="server" Text="Display Report Table Navigation" AutoPostBack="False" />
        </asp:TableCell>
      </asp:TableRow>

     <asp:TableRow ID="TableRow7" runat="server" >
        <asp:TableCell ID="TableCell13" runat="server" class="SubHead" width="180"></asp:TableCell>
        <asp:TableCell ID="TableCell14" runat="server">
            <asp:CheckBox ID="chkDisplayFolderName" runat="server" Text="Display Folder Name" AutoPostBack="False" />
            </asp:TableCell>
      </asp:TableRow>

    
     <asp:TableRow ID="TableRow8" runat="server" >
        <asp:TableCell ID="TableCell15" runat="server" class="SubHead" width="180"></asp:TableCell>
        <asp:TableCell ID="TableCell16" runat="server">
            <asp:CheckBox ID="chkDisplayReportName" runat="server" Text="Display Report Name" AutoPostBack="False" />
            </asp:TableCell>
      </asp:TableRow>

    
    <asp:TableRow ID="TableRow9" runat="server" >
          <asp:TableCell ID="TableCell17" runat="server" class="SubHead" width="180" valign="top" >
            <dnn:label id="lblViewerOptions" runat="server" controlname="chkAutoExport" suffix=":"></dnn:label>
          </asp:TableCell>
          <asp:TableCell ID="TableCell18" runat="server" valign="middle">
            <asp:CheckBox ID="chkAutoExport" runat="server" Text="Auto Export Report" AutoPostBack="True" /> &nbsp;
            <asp:DropDownList ID="cmbExportFormat" runat="server">
                <asp:ListItem>PDF</asp:ListItem>
                <asp:ListItem>EXCEL</asp:ListItem>
                <asp:ListItem>WORD</asp:ListItem>
                <asp:ListItem Value="HTML4.0">HTML</asp:ListItem>
                <asp:ListItem>MHTML</asp:ListItem>
                <asp:ListItem>IMAGE</asp:ListItem>
            </asp:DropDownList>
          </asp:TableCell>
    </asp:TableRow>

        <asp:TableRow runat="server" id="rowExportFileName" Visible="false">
          <asp:TableCell ID="TableCell25" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCell26" runat="server">
              <table border="0"><tr><td>
                  <dnn:label id="lblExportFileName" runat="server" controlname="txtExportFileName" suffix=":"></dnn:label>
                         </td>
                  <td>
                      <asp:TextBox ID="txtExportFileName" runat="server"></asp:TextBox>
                  </td>
                     </tr></table>
              
          </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow runat="server" id="rowExportWarning" Visible="false">
          <asp:TableCell ID="TableCell19" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCell20" runat="server">
              <asp:Label ID="lblExportWarning" runat="server" Text="Export Warning" Font-Bold="True" ForeColor="Red" Visible="false"></asp:Label>
          </asp:TableCell>
    </asp:TableRow>
 
    <asp:TableRow runat="server" ID="rowOpenNewWindow" Visible="true">
        <asp:TableCell ID="TableCell21" runat="server" class="SubHead" Width="180">
        </asp:TableCell>   
        <asp:TableCell ID="TableCell22" runat="server" VerticalAlign="Middle">
            <asp:CheckBox ID="chkNewWindow" runat="server" Text="Open Report in New Window" AutoPostBack="true" /> 
        </asp:TableCell>
    </asp:TableRow>
    
    <asp:TableRow ID="rowOpenNewWindowSettings" runat="server" visible="false">
          <asp:TableCell ID="TableCell23" runat="server" class="SubHead" width="180" valign="top" ></asp:TableCell>
          
          <asp:TableCell ID="TableCell24" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px">
                <asp:Table ID="Table2" runat="server">
                        <asp:TableRow ID="TableRowb10" runat="server">
                            <asp:TableCell ID="TableCellb25" runat="server" ColumnSpan="3" HorizontalAlign="Center" class="SubHead">New Window Settings</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="TableRowb11" runat="server">
                            <asp:TableCell ID="TableCellb26" runat="server">Width</asp:TableCell>
                            <asp:TableCell ID="TableCellb27" runat="server" Width="80px"><asp:TextBox ID="txtNewWindowWidth" runat="server" Width="50px"></asp:TextBox></asp:TableCell>
                            <asp:TableCell ID="TableCellb28" runat="server"><asp:CheckBox ID="chkNewWindowDisplayLocationBar" Text="Display Location Bar" runat="server" /></asp:TableCell>
                        </asp:TableRow>                        
                        <asp:TableRow ID="TableRowb12" runat="server">
                            <asp:TableCell ID="TableCellb29" runat="server">Height</asp:TableCell>
                            <asp:TableCell ID="TableCellb30" runat="server"><asp:TextBox ID="txtNewWindowHeight" runat="server" Width="50px"></asp:TextBox></asp:TableCell>
                            <asp:TableCell ID="TableCellb31" runat="server"><asp:CheckBox ID="chkNewWindowDisplayStatusBar" Text="Display Status Bar" runat="server" /></asp:TableCell>
                        </asp:TableRow>                        
                        <asp:TableRow ID="TableRowb13" runat="server">
                            <asp:TableCell ID="TableCellb32" runat="server">Top</asp:TableCell>
                            <asp:TableCell ID="TableCellb33" runat="server"><asp:TextBox ID="txtNewWindowTop" runat="server" Width="50px"></asp:TextBox></asp:TableCell>
                            <asp:TableCell ID="TableCellb34" runat="server"><asp:CheckBox ID="chkNewWindowDisplayMenuBar" Text="Display Menu Bar" runat="server" /></asp:TableCell>
                        </asp:TableRow>                        
                        <asp:TableRow ID="TableRowb14" runat="server">
                            <asp:TableCell ID="TableCellb35" runat="server">Left</asp:TableCell>
                            <asp:TableCell ID="TableCellb1" runat="server"><asp:TextBox ID="txtNewWindowLeft" runat="server" Width="50px"></asp:TextBox></asp:TableCell>
                            <asp:TableCell ID="TableCellb2" runat="server"><asp:CheckBox ID="chkNewWindowDisplayScrollbars" Text="Display Scroll Bars" runat="server" /></asp:TableCell>
                        </asp:TableRow>                        
                        <asp:TableRow ID="TableRowb1" runat="server">
                            <asp:TableCell ID="TableCellb3" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCellb4" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCellb5" runat="server"><asp:CheckBox ID="chkNewWindowDisplayFullScreen" Text="Display Full Screen" runat="server" /></asp:TableCell>
                        </asp:TableRow>                        
                        <asp:TableRow ID="TableRowb2" runat="server">
                            <asp:TableCell ID="TableCellb6" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCellb7" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCellb8" runat="server"><asp:CheckBox ID="chkNewWindowResizable" Text="Window Resizable" runat="server" /></asp:TableCell>
                        </asp:TableRow>                        
                        <asp:TableRow ID="TableRowb3" runat="server">
                            <asp:TableCell ID="TableCellb9" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCellb10" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCellb11" runat="server"><asp:CheckBox ID="chkNewWindowDisplayToolbar" Text="Display Toolbar" runat="server" /></asp:TableCell>
                        </asp:TableRow>  
                        <asp:TableRow ID="TableRowb15" runat="server">
                            <asp:TableCell ID="TableCellb36" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCellb37" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCellb38" runat="server"><asp:CheckBox ID="chkNewWindowReuse" Text="Reuse Same Popup Window" runat="server" /></asp:TableCell>
                        </asp:TableRow>                                                  
                        
                        
                </asp:Table>
          </asp:TableCell>
    </asp:TableRow>
    
    
    <asp:TableRow ID="TableRowe4" runat="server" >
          <asp:TableCell ID="TableCelld12" runat="server" class="SubHead" width="180" valign="top" ></asp:TableCell>
          <asp:TableCell ID="TableCelld13" runat="server" ><asp:CheckBox ID="chkShowBack" runat="server" Text="Show Report Back Button" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>
    
        
    
    <asp:TableRow ID="TableRowe5" runat="server" >
          <asp:TableCell ID="TableCelld14" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCelld15" runat="server"><asp:CheckBox ID="chkShowExport" runat="server" Text="Show Export Options" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow ID="TableRowe6" runat="server" >
          <asp:TableCell ID="TableCelld16" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCelld17" runat="server"><asp:CheckBox ID="chkShowFind" runat="server" Text="Show Find Control" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow ID="TableRowe7" runat="server" >
          <asp:TableCell ID="TableCelld18" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCelld19" runat="server"><asp:CheckBox ID="chkShowPageNav" runat="server" Text="Show Report Page Navigation Bar" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>
    
    
    <asp:TableRow ID="TableRowe8" runat="server" >
          <asp:TableCell ID="TableCelld20" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCelld21" runat="server"><asp:CheckBox ID="chkShowPrint" runat="server" Text="Show Report Print Button" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow ID="TableRowe9" runat="server" >
          <asp:TableCell ID="TableCelld22" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCelld23" runat="server"><asp:CheckBox ID="chkShowRefresh" runat="server" Text="Show Report Refresh Button" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>
       
    <asp:TableRow ID="TableRowe10" runat="server" >
          <asp:TableCell ID="TableCelld24" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCelld25" runat="server"><asp:CheckBox ID="chkShowZoom" runat="server" Text="Show Report Zoom Controls" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>
    
    
    <asp:TableRow ID="TableRow11" runat="server" >
          <asp:TableCell ID="TableCelld26" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCelld27" runat="server"><asp:CheckBox ID="chkPromptAreaCollapsed" runat="server" Text="Parameter Prompt Area Collapsed" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow12" runat="server" >
          <asp:TableCell ID="TableCelld28" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCelld29" runat="server"><asp:CheckBox ID="chkShowParameterPrompts" runat="server" Text="Show Parameter Prompts" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow13" runat="server" >
          <asp:TableCell ID="TableCelld30" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCelld31" runat="server"><asp:CheckBox ID="chkSizeToReportContent" runat="server" Text="Size to Report Content" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>
    
    <asp:TableRow ID="TableRow14" runat="server" >
          <asp:TableCell ID="TableCell32" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCell33" runat="server"><asp:CheckBox ID="chkShowDocumentMapButton" runat="server" Text="Show Document Map Button" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow15" runat="server" >
          <asp:TableCell ID="TableCell34" runat="server" class="SubHead" width="180"></asp:TableCell>
          <asp:TableCell ID="TableCell35" runat="server"><asp:CheckBox ID="chkDocumentMapCollapsed" runat="server" Text="Document Map Collapsed" AutoPostBack="False" /></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow16" runat="server" >
          <asp:TableCell ID="TableCellc1" runat="server" class="SubHead" width="180" >
          <dnn:label id="lblDocumentMapWidth" runat="server" controlname="txtDocumentMapWidth" suffix=":"></dnn:label></asp:TableCell>
          <asp:TableCell ID="TableCellc2" runat="server" valign="top" ><asp:TextBox ID="txtDocumentMapWidth" runat="server" Width="45px"></asp:TextBox></asp:TableCell>
    </asp:TableRow>                  
    
    
    <asp:TableRow ID="TableRow1" runat="server" VerticalAlign="Middle" >
          <asp:TableCell ID="TableCellc3" runat="server" class="SubHead" width="180"><dnn:label id="lblFilter" runat="server" controlname="txtFilter" suffix=":"></dnn:label></asp:TableCell>
          <asp:TableCell ID="TableCellc4" runat="server">
                <table cellpadding="0" cellspacing="0" border="0">
                <tr valign="middle">
                <td><asp:TextBox id="txtFilter" runat="server" width="150px" /></td>
                <td>&nbsp;<dnn:label id="lblFilterInclude" runat="server" controlname="cmbFilterMatch" suffix=":"></dnn:label></td>
                <td><asp:DropDownList ID="cmbFilterInclude" runat="server">
                        <asp:ListItem Value="True">Include</asp:ListItem>
                        <asp:ListItem Value="False">Exclude</asp:ListItem>
                </asp:DropDownList>
                </td>
                 <td><asp:Button ID="cmdValidate" runat="server" Text="Validate" /></td>
                 <td><asp:Label ID="lblFilterResult" runat="server"/></td>
                 </tr>
                 </table>
          </asp:TableCell>

    </asp:TableRow>

      <asp:TableRow ID="TableRowc3" runat="server" >
        <asp:TableCell ID="TableCellc10" runat="server" class="SubHead" width="180" >
        <dnn:label id="lblAsyncPostbackTimeout" runat="server" controlname="txtAsyncPostbackTimeout" suffix=":"></dnn:label></asp:TableCell>
        <asp:TableCell ID="TableCellc11" runat="server" valign="top" ><asp:TextBox ID="txtAsyncPostbackTimeout" runat="server" Width="45px"></asp:TextBox></asp:TableCell>
     </asp:TableRow>    

      <asp:TableRow ID="TableRowc4" runat="server" >
        <asp:TableCell ID="TableCellc12" runat="server" class="SubHead" width="180" >
        <dnn:label id="lblWidth" runat="server" controlname="txtWidth" suffix=":"></dnn:label></asp:TableCell>
        <asp:TableCell ID="TableCellc13" runat="server" valign="top" ><asp:TextBox ID="txtWidth" runat="server" Width="45px"></asp:TextBox></asp:TableCell>
     </asp:TableRow>    
      <asp:TableRow ID="TableRowc5" runat="server" >
        <asp:TableCell ID="TableCellc14" runat="server" class="SubHead" width="180"  >
        <dnn:label id="lblHeight" runat="server" controlname="txtHeight" suffix=":"></dnn:label></asp:TableCell>
        <asp:TableCell ID="TableCellc15" runat="server" valign="top"  ><asp:TextBox ID="txtHeight" runat="server" Width="45px"></asp:TextBox></asp:TableCell>
     </asp:TableRow>    
      <asp:TableRow ID="TableRowc6" runat="server" >
        <asp:TableCell ID="TableCellc16" runat="server" class="SubHead" width="180"  >
        <dnn:label id="lblZoomMode" runat="server" controlname="cmbZoomMode" suffix=":"></dnn:label></asp:TableCell>
        <asp:TableCell ID="TableCellc17" runat="server" valign="top" >
            <asp:DropDownList ID="cmbZoomMode" runat="server" AutoPostBack = "true">
                <asp:ListItem>PageWidth</asp:ListItem>
                <asp:ListItem>FullPage</asp:ListItem>
                <asp:ListItem>Percent</asp:ListItem>
            </asp:DropDownList> 
            </asp:TableCell>
     </asp:TableRow>
     <asp:TableRow ID="TableRowc7" runat="server" >
        
            <asp:TableCell ID="TableCellc18" runat="server" class="SubHead" width="180" >
            <dnn:label id="lblZoomPercent" runat="server" controlname="txtZoomPercent" suffix=":"></dnn:label>
             </asp:TableCell>
            <asp:TableCell ID="TableCellc19" runat="server" valign="top" >
            <asp:TextBox ID="txtZoomPercent" runat="server" Visible ="true" Text ="100" Width="45px"></asp:TextBox>
            </asp:TableCell>
     </asp:TableRow>
        
     <asp:TableRow ID="TableRowc8" runat="server" >
        
            <asp:TableCell ID="TableCellc20" runat="server" class="SubHead" width="180" >
                &nbsp;</asp:TableCell>
            <asp:TableCell ID="TableCellc21" runat="server" valign="top"  >
                &nbsp;<asp:CheckBox ID="chkAllowPassUserInfo" runat="server" Text="Allow Pass UserId and PortalId via URL" /></asp:TableCell>
     </asp:TableRow>

    <asp:TableRow ID="TableRowc9" runat="server" >

		<asp:TableCell ID="TableCellc22" runat="server" class="SubHead" width="180"><dnn:label id="lblParms" suffix=":" controlname="dgParms" runat="server"></dnn:label></asp:TableCell>
		<asp:TableCell ID="TableCellc23" runat="server" vAlign="bottom" width="325">
		    <asp:datagrid id="dgParms" runat="server" CssClass="HeaderStyle" ShowFooter="True" AllowSorting="True"
				AutoGenerateColumns="False" datakeyfield="ParmId">
				<FooterStyle CssClass="HeaderrowStyle"></FooterStyle>
				<AlternatingItemStyle CssClass="HeaderRowAlternate"></AlternatingItemStyle>
				<ItemStyle CssClass="headerRowStyle"></ItemStyle>
				<HeaderStyle Font-Bold="True" CssClass="HeaderRowsTyle"></HeaderStyle>
				<Columns>
					<asp:BoundColumn Visible="False" DataField="ParmId" ReadOnly="True"></asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Report Parameter Name">
						<ItemTemplate>
							<asp:Label id="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ParmName") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="txtParmName" runat="server" CssClass="normaltextbox" ></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="txtEditParmName" runat="server" CssClass="normaltextbox" Text='<%# DataBinder.Eval(Container, "DataItem.ParmName") %>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Parameter Value / Token">
						<ItemTemplate>
							<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ParmValue") %>'>
							</asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox id="txtParmValue" CssClass="normaltextbox" runat="server"></asp:TextBox>
						</FooterTemplate>
						<EditItemTemplate>
							<asp:TextBox id="txtEditParmValue" CssClass="normaltextbox" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ParmValue") %>' >
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<ItemTemplate>
							<asp:imagebutton id="imgDelete" runat="server" AlternateText="Delete" CommandName="Delete" ImageUrl="~/images/delete.gif"></asp:imagebutton>
						</ItemTemplate>
						<FooterTemplate>
							<asp:imagebutton id="imgAdd" runat="server" AlternateText="Add" CommandName="AddParm" ImageUrl="~/images/add.gif"></asp:imagebutton>
						</FooterTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<ItemTemplate>
							<asp:imagebutton id="imgEdit" runat="server" AlternateText="Edit" CommandName="Edit" ImageUrl="~/images/edit.gif"></asp:imagebutton>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:LinkButton runat="server" resourcekey="dgupdatetext" CommandName="Update" ID="lnkUpdate" text="Update"
								NAME="lnkUpdate"></asp:LinkButton>&nbsp;
							<asp:LinkButton runat="server" Text="Cancel" resourcekey="dgcanceltext" CommandName="Cancel" CausesValidation="false"
								ID="lnkCancel" NAME="Linkbutton2"></asp:LinkButton>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn Visible="False" DataField="ModuleId" ReadOnly="True"></asp:BoundColumn>
				</Columns>
			</asp:datagrid>
	    </asp:TableCell>
        
    </asp:TableRow>
       
           
</asp:table>

<br />
<div style="text-align: center">
<asp:LinkButton ID="cmdUpdate" runat="server" CssClass="CommandButton" 
        CausesValidation="False" ><img src="/images/save.gif" alt="Save" />Save Changes</asp:LinkButton>
    &nbsp;
<asp:LinkButton ID="cmdCancel" runat="server" CssClass="CommandButton" 
        CausesValidation="False" ><img src="/images/lt.gif" alt="Cancel" />Cancel</asp:LinkButton>
</div>