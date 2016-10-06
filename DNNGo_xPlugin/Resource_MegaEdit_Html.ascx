<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Resource_MegaEdit_Html.ascx.cs"
    Inherits="DNNGo.Modules.xPlugin.Resource_MegaEdit_Html" %>

<div class="form-group">
    <%=ViewControlTitle("lblTitle", "Title", "txtTitle", ":", "col-sm-3 control-label")%>
    <div class="col-sm-9">
        <asp:TextBox runat="server" ID="txtTitle" Width="300px" CssClass="form-control validate[required]"></asp:TextBox>
    </div>
</div>
<div class="form-group">
    <%=ViewControlTitle("lblContentText", "Content Text", "txtContentText", ":", "col-sm-3 control-label")%>
    <div class="col-sm-9">
        <asp:TextBox runat="server" ID="txtContentText" Width="100%" CssClass="tinymce form-control validate[required]" TextMode="MultiLine" Rows="10"></asp:TextBox>
    </div>
</div>
<div class="form-group" >
    <asp:Button CssClass="btn btn-primary" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
        runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
    <asp:HyperLink CssClass="btn btn-default" ID="cmdCancel" resourcekey="cmdCancel" runat="server" Text="Cancel" onclick="window.parent.$('#MegamenuModule_Modal').modal('hide');"></asp:HyperLink>
</div>
