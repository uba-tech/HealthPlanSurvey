<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Manager_SkinOptions.ascx.cs" Inherits="DNNGo.Modules.xPlugin.Manager_SkinOptions" %>
<!-- start: PAGE HEADER -->
<div class="row">
    <div class="col-sm-12">
        <!-- start: PAGE TITLE & BREADCRUMB -->
        <div class="page-header">
            <h1>
                <i class="fa fa-plus"></i> <%=ViewResourceText("Header_Title", "Skin Options")%>
                <%--<small>overview &amp; stats </small>--%></h1>
        </div>
        <!-- end: PAGE TITLE & BREADCRUMB -->
    </div>
</div>
<!-- end: PAGE HEADER -->



        <div class="row"> 
          <!-- start: PAGE CONTENT -->
          <div class="col-sm-8">
            <ul id="myTab_ul_tabs" class="ul_tabs nav nav-tabs tab-bricky">
              <asp:Literal runat="server" ID="liNavTabsHTML"></asp:Literal>
            </ul>
            <div class="tab-content">

                <asp:Repeater ID="RepeaterCategories" runat="server" OnItemDataBound="RepeaterCategories_ItemDataBound">
                    <ItemTemplate>

                     <div class="tab-pane <%#(Container.ItemIndex==1)?"in active":""%>" id="tabs-left-<%#FormatName( Eval("Key"))%>">
                        <div id="accordion<%#FormatName( Eval("Key"))%>">
                          <asp:Repeater ID="RepeaterGroup" runat="server" OnItemDataBound="RepeaterGroup_ItemDataBound">
                            <ItemTemplate>
                                 <div class="panel panel-default small-bottom">
                                    <div class="panel-heading"> <i class="fa fa-external-link-square"></i> <%# Eval("Key")%>
                                      <div class="panel-tools"> <a class="btn btn-xs btn-link panel-collapse collapses" data-toggle="collapse" data-parent="#accordion<%#FormatName( Eval("Parent"))%>" href="#options_<%#FormatName( Eval("Key"))%>"></a> </div>
                                    </div>
                                    <div id="options_<%#FormatName( Eval("Key"))%>" class="panel-collapse collapse <%#(Container.ItemIndex==1)?"in":""%>">
                                      <div class="panel-body">
                                        <div class="form-horizontal  form-patch">
                                            <asp:Repeater ID="RepeaterOptions" runat="server" OnItemDataBound="RepeaterOptions_ItemDataBound">
                                                <ItemTemplate>
                                                       <div class="form-group">
                                                        <asp:Literal ID="liTitle" runat="server"></asp:Literal>
                                                        <div class="controls col-sm-9">
                                                            <asp:PlaceHolder ID="ThemePH" runat="server"></asp:PlaceHolder>
                                                            <asp:Literal ID="liHelp" runat="server"></asp:Literal>
                                                        </div>
                                                      </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            </div>
                                         </div>
                                    </div>
                                  </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                  </div>
                 </ItemTemplate>
                </asp:Repeater>

                            <div class="row"> 
                <div class="col-sm-12"> 

                  <div class="form-group">
                         <asp:Button CssClass="btn btn-primary" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
                            runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
                        <asp:Button CssClass="input_button btn" lang="Submit" ID="cmdReset" resourcekey="cmdReset" runat="server"
                            Text="Reset" OnClick="cmdReset_Click"></asp:Button>&nbsp;
                        
                        
                        </div>
                  </div>
            </div>

            </div>





          </div>






          <div class="col-sm-4">
          	<h4 style="margin:0 0 10px 0;">Skin Lists
          </h4>
            <div id="accordion">

            <asp:Repeater ID="RepeaterSkins" runat="server" OnItemDataBound="RepeaterSkins_ItemDataBound">
                    <ItemTemplate>

                      <div class="panel panel-default small-bottom">
                        <div class="panel-heading"> <i class="fa fa-external-link-square"></i> <%#Eval("Name")%>
                          <div class="panel-tools"> <a class="btn btn-xs btn-link panel-collapse <asp:Literal ID="LiExpand" runat="server"></asp:Literal>" data-toggle="collapse" data-parent="#accordion" href="#collapse_Skin<%#Container.ItemIndex %>"></a> </div>
                        </div>
                        <div id="collapse_Skin<%#Container.ItemIndex %>" class="panel-collapse collapse <asp:Literal ID="liActive" runat="server"></asp:Literal>">
                          <div class="panel-body">
                          
                            <p class="fa-border"> <asp:Literal ID="liThumbnails" runat="server"></asp:Literal></p>
                            <p>
                             <asp:HyperLink ID="hlOptions" Text="Options" resourcekey="hlOptions"   runat="server" CssClass="btn btn-primary btn-sm"></asp:HyperLink>
                            &nbsp;&nbsp;
                             <asp:HyperLink ID="hlCopy" Text="Copy" resourcekey="hlCopy"   runat="server" CssClass="btn btn-primary btn-sm"></asp:HyperLink>
                          </div>
                        </div>
                      </div>
                   </ItemTemplate>
                </asp:Repeater>
 
            </div>
          </div>
          
        </div>

        <!-- end: PAGE CONTENT--> 


<script type="text/javascript">
    jQuery(function ($) {
        $("#myTab_ul_tabs li a").click(function () { $.cookie("RepeaterCategories", $(this).attr("href")); $.cookie("RepeaterGroup", ""); });
        $("div.panel-tools a.panel-collapse").click(function () { $.cookie("RepeaterGroup", $(this).attr("href")); });

        var Categories = $.cookie("RepeaterCategories");
        var Group = $.cookie("RepeaterGroup");

        if (Categories != undefined && Categories !== "") {
            $("div.tab-pane").removeClass("in").removeClass("active");
            $(Categories).addClass("in").addClass("active");
            $("#myTab_ul_tabs li").removeClass("active");
            $("#myTab_ul_tabs li a[href='" + Categories + "']").parent().addClass("active");

        }

        if (Group != undefined && Group !== "") {
            $(Group).parents("div.tab-pane").find("div.panel-collapse").removeClass("in");
            $(Group).addClass("in");
        }

    });
</script>