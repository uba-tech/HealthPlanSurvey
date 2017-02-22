<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ServerAdmin.ascx.vb" Inherits="BS.Modules.SSRS.ServerAdmin" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<br />
<div style="text-align:left">
<div class="Head">Server Administration</div>
<div class="Normal">Here you can register one or more servers that will be accessible to instances of 
the reporting services modules.</div>
<br />
</div>

<asp:DataGrid ID="dgServers" runat="server" AutoGenerateColumns="False"
    CssClass="HeaderStyle" DataKeyField="ServerId" ShowFooter="True" HorizontalAlign="center" > 
    <FooterStyle CssClass="HeaderrowStyle" />
    <AlternatingItemStyle CssClass="HeaderRowAlternate" />
    <ItemStyle CssClass="headerRowStyle" Font-Size="10pt" />
    <HeaderStyle CssClass="HeaderRowsTyle" Font-Bold="True" Font-Size="10pt" />
    <Columns>
        
        <asp:BoundColumn DataField="ServerId" ReadOnly="True" Visible="False"></asp:BoundColumn>
        
        
        <asp:TemplateColumn HeaderText="ServerURL">
            <HeaderTemplate>
                <dnn:label id="lblServerURL" runat="server" suffix=":"></dnn:label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:TextBox  ID="txtServerURL" runat="server"  BorderStyle="none" BackColor="transparent" ReadOnly="true" Text='<%# DataBinder.Eval(Container, "DataItem.ServerURL") %>'></asp:TextBox>
            </ItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtServerURL" runat="server" CssClass="normaltextbox" ></asp:TextBox>
            </FooterTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtServerURL" runat="server" CssClass="normaltextbox" Text='<%# DataBinder.Eval(Container, "DataItem.ServerURL") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateColumn>
        
        
        <asp:TemplateColumn HeaderText="ServerVersion">
            <HeaderTemplate>
                <dnn:label id="lblServerVersion" runat="server" suffix=":"></dnn:label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="cmbServerVersion" runat="server" Enabled="false"  SelectedValue='<%# DataBinder.Eval(Container, "DataItem.ServerVersion") %>'>
                    <asp:ListItem Value="RS2008">Reporting Services 2008</asp:ListItem>
                    <asp:ListItem Value="RS2012">Reporting Services 2012</asp:ListItem>
                    <asp:ListItem Value="RS2014">Reporting Services 2014</asp:ListItem>
                    <asp:ListItem Value="RSAZURE">Azure SQL Reporting</asp:ListItem>
                    <asp:ListItem Value="RS2005" Enabled="false">Reporting Services 2005 - Deprecated</asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
            <FooterTemplate>
                <asp:DropDownList ID="cmbServerVersion" runat="server" AutoPostBack="true">
                    <asp:ListItem Value="RS2008">Reporting Services 2008</asp:ListItem>
                    <asp:ListItem Value="RS2012">Reporting Services 2012</asp:ListItem>
                    <asp:ListItem Value="RS2014">Reporting Services 2014</asp:ListItem>
                    <asp:ListItem Value="RSAZURE">Azure SQL Reporting</asp:ListItem>
                    <asp:ListItem Value="RS2005" Enabled="false">Reporting Services 2005 - Deprecated</asp:ListItem>
                </asp:DropDownList>
            </FooterTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="cmbServerVersion" runat="server"  SelectedValue='<%# DataBinder.Eval(Container, "DataItem.ServerVersion") %>'>
                    <asp:ListItem Value="RS2008">Reporting Services 2008</asp:ListItem>
                    <asp:ListItem Value="RS2012">Reporting Services 2012</asp:ListItem>
                    <asp:ListItem Value="RS2014">Reporting Services 2014</asp:ListItem>
                    <asp:ListItem Value="RSAZURE">Azure SQL Reporting</asp:ListItem>
                    <asp:ListItem Value="RS2005" Enabled="false">Reporting Services 2005 - Deprecated</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateColumn>
        
       
        <asp:TemplateColumn HeaderText="UserName">
            <HeaderTemplate>
                <dnn:label id="lblUserName" runat="server" suffix=":"></dnn:label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:TextBox ID="txtUserName" runat="server" ReadOnly="true" BackColor="transparent" Borderstyle="none" CssClass="normaltextbox"  Text='<%# DataBinder.Eval(Container, "DataItem.UserName") %>'></asp:TextBox>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="normaltextbox" ></asp:TextBox>
            </FooterTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="normaltextbox" Text='<%# DataBinder.Eval(Container, "DataItem.UserName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateColumn>
        
        
        <asp:TemplateColumn HeaderText="Password">
            <HeaderTemplate>
                <dnn:label id="lblPassword" runat="server" suffix=":"></dnn:label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:TextBox ID="txtPassword" runat="server"  BackColor="Transparent" Text="......"  BorderStyle="none" Width="40px" value='<%# DataBinder.Eval(Container, "DataItem.Password") %>'></asp:TextBox>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="normaltextbox" TextMode="Password"></asp:TextBox>
            </FooterTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="normaltextbox"  TextMode="Password" Text='<%# DataBinder.Eval(Container, "DataItem.Password") %>' value='<%# DataBinder.Eval(Container, "DataItem.Password") %>' ></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateColumn>
        
        
        <asp:TemplateColumn HeaderText="Domain">
            <HeaderTemplate>
                <dnn:label id="lblDomain" runat="server" suffix=":"></dnn:label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:TextBox ID="txtDomain" runat="server" CssClass="normaltextbox"  Text='<%# DataBinder.Eval(Container, "DataItem.Domain") %>' ReadOnly="true" BackColor="transparent" BorderStyle="none" ></asp:TextBox>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtDomain" runat="server" CssClass="normaltextbox" ></asp:TextBox>
            </FooterTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDomain" runat="server" CssClass="normaltextbox" Text='<%# DataBinder.Eval(Container, "DataItem.Domain") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateColumn>
        
       
        <asp:TemplateColumn>
            <ItemTemplate>
                <asp:ImageButton ID="imgDelete" runat="server" AlternateText="Delete" CommandName="Delete"
                    ImageUrl="~/images/delete.gif" />
            </ItemTemplate>
            <FooterTemplate>
                <asp:ImageButton ID="imgAdd" runat="server" AlternateText="Add" CommandName="AddServer"
                    ImageUrl="~/images/add.gif" />
            </FooterTemplate>
        </asp:TemplateColumn>
        
       
        <asp:TemplateColumn>
            <ItemTemplate>
                <asp:ImageButton ID="imgEdit" runat="server" AlternateText="Edit" CommandName="Edit"
                    ImageUrl="~/images/edit.gif" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" NAME="lnkUpdate"
                    resourcekey="dgupdatetext" Text="Update"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="false" CommandName="Cancel"
                    NAME="Linkbutton2" resourcekey="dgcanceltext" Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
        </asp:TemplateColumn>
        
        
        <asp:TemplateColumn>
            <ItemTemplate>
                <asp:ImageButton ID="imgTest" runat="server" AlternateText="Test Connection" CommandName="Test"
                    ImageUrl="~/images/fwd.gif" />
            </ItemTemplate>
        </asp:TemplateColumn>
       
        <asp:BoundColumn DataField="PortalId" ReadOnly="True" Visible="False"></asp:BoundColumn>
        
    </Columns>
</asp:DataGrid>

<br />
<div style="text-align:center">
    <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
    <br /><br />
    <asp:LinkButton ID="cmdBack" runat="server" CssClass="CommandButton"><img src="/images/lt.gif" alt="Cancel" />Back</asp:LinkButton>
</div>