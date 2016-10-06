<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Resource_MegaEdit_Module.ascx.cs" Inherits="DNNGo.Modules.xPlugin.Resource_MegaEdit_Module" %>

<div class="form-group">
    <%=ViewControlTitle("lblTitle", "Title", "txtTitle", ":", "col-sm-3 control-label")%>
    <div class="col-sm-9">
        <asp:TextBox runat="server" ID="txtTitle"  Width="300px"  CssClass="form-control validate[required]"></asp:TextBox>
    </div>
</div>
<div class="form-group">
    <%=ViewControlTitle("lblPages", "Pages", "ddlPages", ":", "col-sm-3 control-label")%>
    <div class="col-sm-9">
       <asp:DropDownList ID="ddlPages" runat="server"   Width="300px"  CssClass="form-control  validate[required]" onselectedindexchanged="ddlPages_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
    </div>
</div>
<div class="form-group">
    <%=ViewControlTitle("lblModules", "Modules", "ddlModules", ":", "col-sm-3 control-label")%>
    <div class="col-sm-9">
         <asp:DropDownList ID="ddlModules" runat="server"   Width="300px"  CssClass="form-control  validate[required]"></asp:DropDownList>
    </div>
</div>
<div class="form-group">
    <asp:Button CssClass="btn btn-primary" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
        runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
      <asp:HyperLink CssClass="btn btn-default" ID="cmdCancel" resourcekey="cmdCancel" runat="server" Text="Cancel" onclick="window.parent.$('#MegamenuModule_Modal').modal('hide');"></asp:HyperLink>
</div>
