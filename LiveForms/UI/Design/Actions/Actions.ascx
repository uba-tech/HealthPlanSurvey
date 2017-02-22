<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Actions.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.Actions" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/Labelcontrol.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Mandeeps.Web" Namespace="Mandeeps.Web.UI.WebControls" TagPrefix="Mandeeps" %>


<script>
    function InitSorting(PortalId, ModuleId, Selector, AjaxHandler) {

        //jQuery('#' + Selector + ' tbody tr:first').addClass('NoSortable');
        //jQuery('#' + Selector + ' tbody tr:last').addClass('NoSortable');

        jQuery('#' + Selector + ' tbody').sortable({
            items: '.showmessage',
            helper: function (e, tr) {
                var $originals = tr.children();
                var $helper = tr.clone();
                $helper.children().each(function (index) {
                    // Set helper cell sizes to match the original sizes
                    $(this).width($originals.eq(index).width());
                });
                return $helper;
            },
            axis: 'y',
            containment: "parent",
            update: function (event, ui) { SortStates(PortalId, ModuleId, AjaxHandler); },
            //items: 'tr:not(.redirect)',
            //items: 'tr:not(.normal)'
            //jQuery('.redirect tr, .normal tr').disableSelection()
        });

        jQuery('#' + Selector + ' tbody').sortable({
            items: '.redirect',
            helper: function (e, tr) {
                var $originals = tr.children();
                var $helper = tr.clone();
                $helper.children().each(function (index) {
                    // Set helper cell sizes to match the original sizes
                    $(this).width($originals.eq(index).width());
                });
                return $helper;
            },
            axis: 'y',
            containment: "parent",
            update: function (event, ui) { SortStates(PortalId, ModuleId, AjaxHandler); },
            //items: 'tr:not(.showmessage)',
            //items: 'tr:not(.normal)'
        });

        jQuery('#' + Selector + ' tbody').sortable({
            items: '.normal',
            helper: function (e, tr) {
                var $originals = tr.children();
                var $helper = tr.clone();
                $helper.children().each(function (index) {
                    // Set helper cell sizes to match the original sizes
                    $(this).width($originals.eq(index).width());
                });
                return $helper;
            },
            axis: 'y',
            containment: "parent",
            update: function (event, ui) { SortStates(PortalId, ModuleId, AjaxHandler); },
            //items: 'tr:not(.showmessage)',
            //items: 'tr:not(.redirect)'
        });

    }

    function SortStates(PortalId, ModuleId, AjaxHandler) {

        var items = jQuery('.SortItems');
        var GuidIDs = '';

        for (var x = 0; x < items.length; x++) {
            GuidIDs += items[x].alt + ',';
        };

        GuidIDs = GuidIDs.substring(0, GuidIDs.length - 1);

        jQuery.post(AjaxHandler, {
            Action: 'SortAction',
            GUIDIDs: GuidIDs,
            PortalId: PortalId,
            ModuleId: ModuleId
        }, function (data) {

        });
    }
</script>
<div class="LiveForm FormVerticalTabs">
    <Mandeeps:TabStrip runat="server" ID="VerticalTabs" TabsPersistence="true" SelectedIndex="0" Theme="Vertical"
        ThemePath="~/DesktopModules/LiveForms/Resources/Tabs">
        <Mandeeps:Tab ID="ClientSide" runat="server">
            <div class="caption">
                <asp:Label ID="lClientInfo" runat="server" Resourcekey="lClientInfo" />
            </div>
            <div>
                <ul>
                    <li>
                        <asp:RadioButton ID="rbShowHideField" runat="server" Text="" GroupName="rbClientSide" AutoPostBack="true" OnCheckedChanged="rbShowHideField_CheckedChanged" /><asp:Label ID="ShowHideField" runat="server" Resourcekey="lShowHideField" />
                        <br />
                        <span class="clientradiospan">Provide efficient forms to your users according to their choices</span>
                    </li>
                    <li>
                        <asp:RadioButton ID="rbSkiptoPage" runat="server" Text="" GroupName="rbClientSide" AutoPostBack="true" OnCheckedChanged="rbSkiptoPage_CheckedChanged" /><asp:Label ID="SkiptoPage" runat="server" Resourcekey="lSkiptoPage" />
                        <br />
                        <span class="clientradiospan">Allow users to jump to a part of your form according to their choices</span>
                    </li>
                    <li>
                        <asp:RadioButton ID="rbRequired" runat="server" Text="" GroupName="rbClientSide" AutoPostBack="true" OnCheckedChanged="rbRequired_CheckedChanged" /><asp:Label ID="lClientSidemsg" runat="server" Resourcekey="lClientSidemsg" />
                        <br />
                        <span class="clientradiospan">Require a field based on another field</span>
                    </li>
                    <li>
                        <asp:RadioButton ID="rbSQLQuery" runat="server" Text="" GroupName="rbClientSide" AutoPostBack="true" OnCheckedChanged="rbSQLQuery_CheckedChanged" /><asp:Label ID="Label1" runat="server" Resourcekey="lSQLQuery" />
                        <br />
                        <span class="clientradiospan">Update a field by executing a SQL Query; optionally based on another field</span>
                    </li>
                </ul>
            </div>
            <telerik:radgrid id="gvClientActions" style="width: 99%; overflow-x: auto;" runat="server"
                allowpaging="True" allowsorting="True" autogeneratecolumns="false" gridlines="None"
                onneeddatasource="gvClientActions_NeedDataSource" onitemdatabound="gvClientActions_ItemDataBound" OnDeleteCommand="gvClientActions_DeleteCommand">
                <mastertableview datakeynames="GUID" nomasterrecordstext="Looks like you have not created any Client action!">
                    <RowIndicatorColumn>
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn>
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn ItemStyle-Width="100px" HeaderText="Action" DataField="Actions">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn ItemStyle-Width="100px" HeaderText="Condition" DataField="ConditionSet">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="Sortable" ItemStyle-Width="30px">
                         <ItemTemplate>
                          <asp:Image ID="ClientSortable" CssClass="SortItems" runat="server" ImageUrl="~/DesktopModules/LiveForms/Resources/Images/Sortable.png"
                           Style="cursor: move"></asp:Image>
                         </ItemTemplate>
                         </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn DataField="GUID" ItemStyle-Width="30px">
                          <ItemTemplate>
                          <asp:ImageButton OnClick="ClientEditState_Click" ID="ClientEdit" runat="server"
                          ImageUrl="~/DesktopModules/LiveForms/Resources/Images/Edit.gif"></asp:ImageButton>
                           </ItemTemplate>
                           </telerik:GridTemplateColumn>
                        <telerik:GridButtonColumn ItemStyle-Width="20px" CommandName="Delete" Text="Delete"
                            UniqueName="DeleteColumn" ConfirmText="Are you sure you want to delete?" ButtonType="ImageButton">
                        </telerik:GridButtonColumn>                                                   
                    </Columns>
                </mastertableview>
            </telerik:radgrid>


        </Mandeeps:Tab>

        <Mandeeps:Tab ID="ServerSide" runat="server">
            <div class="caption">
                <asp:Label ID="lServerInfo" runat="server" Resourcekey="lServerInfo" />
            </div>
            <ul id="menu">
                <li><asp:Label runat="server" ResourceKey="lAddAction" Text="Add Action"></asp:Label>
                    <ul>
                        <li>
                            <asp:Label runat="server" ResourceKey="lDNN" Text="DNN"></asp:Label>
                            <ul>
                                <li>
                                    <asp:HyperLink ID="AddRole" Text="" runat="server" ResourceKey="lAddRole">Add Role</asp:HyperLink></li>
                                <li>
                                    <asp:HyperLink ID="RemoveRole" Text="" runat="server" ResourceKey="lRemoveRole">Remove Role</asp:HyperLink></li>
                                <li>
                                    <asp:HyperLink ID="Login" Text="" runat="server" ResourceKey="Login">Login</asp:HyperLink></li>
                                <li>
                                    <asp:HyperLink ID="DNNRegisteration" Text="" runat="server" ResourceKey="lDNNRegisteration">Register</asp:HyperLink></li>

                            </ul>
                        </li>
                        <li>
                            <asp:Label runat="server" ResourceKey="lSQL" Text="SQL"></asp:Label>
                            <ul>
                                <li>
                                    <asp:HyperLink ID="ExecuteSQL" Text="" runat="server" ResourceKey="lExecuteSQL">Execute SQL</asp:HyperLink></li>
                            </ul>
                        </li>
                        <li>
                            <asp:Label runat="server" ResourceKey="lCommunication" Text="Communication"></asp:Label>
                            <ul>
                                <li>
                                    <asp:HyperLink ID="Email" Text="" runat="server" ResourceKey="lEmail">Send Email</asp:HyperLink></li>

                            </ul>
                        </li>
                        <li>
                            <asp:Label runat="server" ResourceKey="lScripting" Text="Scripting"></asp:Label>
                            <ul>
                                <li>
                                    <asp:HyperLink ID="ExecuteJScript" Text="" runat="server" ResourceKey="lExecuteJScript">Execute JScript</asp:HyperLink></li>
                            </ul>
                        </li>
                        <li>
                            <asp:Label runat="server" ResourceKey="lHttp" Text="Http"></asp:Label>
                            <ul>
                                <li>
                                    <asp:HyperLink ID="HttpPost" Text="" runat="server" ResourceKey="lHttpPost">Http Post</asp:HyperLink></li>
                                <li>
                                    <asp:HyperLink ID="Redirect" Text="" runat="server" ResourceKey="lRedirect">Redirect</asp:HyperLink></li>
                            </ul>
                        </li>
                        <li>
                            <asp:Label runat="server" ResourceKey="lMessage" Text="Message"></asp:Label>
                            <ul>
                                <li>
                                    <asp:HyperLink ID="ShowMessage" Text="" runat="server" ResourceKey="lShowMessage">Show Message</asp:HyperLink></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
            <br />
            <telerik:radgrid id="gvActions" style="width: 99%; overflow-x: auto;" runat="server"
                allowpaging="True" allowsorting="True" autogeneratecolumns="false" gridlines="None"
                onneeddatasource="gvActions_NeedDataSource" onitemdatabound="gvActions_ItemDataBound" OnDeleteCommand="gvActions_DeleteCommand">
                <mastertableview datakeynames="GUID" nomasterrecordstext="Looks like you have not created any action!">
                    <RowIndicatorColumn>
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn>
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn ItemStyle-Width="100px" HeaderText="Action" DataField="Actions">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn ItemStyle-Width="100px" HeaderText="Condition" DataField="ConditionSet">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="Sortable" ItemStyle-Width="30px">
                         <ItemTemplate>
                          <asp:Image ID="Sortable" CssClass="SortItems" runat="server" ImageUrl="~/DesktopModules/LiveForms/Resources/Images/Sortable.png"
                           Style="cursor: move"></asp:Image>
                         </ItemTemplate>
                         </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn DataField="GUID" ItemStyle-Width="30px">
                          <ItemTemplate>
                          <asp:ImageButton OnClick="EditState_Click" ID="Edit" runat="server"
                          ImageUrl="~/DesktopModules/LiveForms/Resources/Images/Edit.gif"></asp:ImageButton>
                           </ItemTemplate>
                           </telerik:GridTemplateColumn>
                        <telerik:GridButtonColumn ItemStyle-Width="20px" CommandName="Delete" Text="Delete"
                            UniqueName="DeleteColumn" ConfirmText="Are you sure you want to delete?" ButtonType="ImageButton">
                        </telerik:GridButtonColumn>
                                                   
                    </Columns>
                </mastertableview>
            </telerik:radgrid>
        </Mandeeps:Tab>
    </Mandeeps:TabStrip>
    <%--<div>
         <asp:LinkButton ID="LinkButton1" Text="Back" CssClass="mbutton2" ResourceKey="bBack" runat="server" OnClick="bCancel_Click"></asp:LinkButton>
    </div>--%>
   

</div>
