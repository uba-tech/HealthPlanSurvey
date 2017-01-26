<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lists.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Controls.Lists" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/Labelcontrol.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="LiveForm">
    <asp:Label runat="server" CssClass="caption" ResourceKey="linfobar"></asp:Label>


    <div id="divListTree" style="float: left;">

        <telerik:RadTreeView ID="tvList" EnableDragAndDropBetweenNodes="false" runat="server" EnableDragAndDrop="false" OnNodeClick="tvList_NodeClick">
        </telerik:RadTreeView>
        <br />

    </div>

    <asp:MultiView ID="ListInfo" runat="server">
        <asp:View ID="CreateList" runat="server">
            <table>
                <tr>
                    <td>
                        <dnn:Label ID="lListScope" runat="server" ResourceKey="lListScope" Suffix=":" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlListScope" runat="server" Width="306px">
                            <asp:ListItem Value="Global" Text="Host: All Live Forms Modules" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="Portal" Text="Portal: All Live Forms Modules in This Portal"></asp:ListItem>
                            <asp:ListItem Value="Module" Text="Module: This Live Forms Module Only"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <%-- <tr>
                    <td>
                        <dnn:Label ID="lParentList" runat="server" ResourceKey="lParentList" Suffix=":" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlParenList" runat="server" AutoPostBack="true" Width="306px" OnSelectedIndexChanged="ddlParenList_SelectedIndexChanged">
                        </asp:DropDownList></td>
                </tr>--%>
                <tr>
                    <td>
                        <dnn:Label ID="lListName" runat="server" ResourceKey="lListName" Suffix=":" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbListName" runat="server" Width="295px"></asp:TextBox></td>
                </tr>
                <%--<tr>
                    <td>
                        <dnn:Label ID="lIsDefault" runat="server" ResourceKey="lIsDefault" Suffix=":" />
                    </td>
                    <td>
                        <asp:CheckBox ID="cbIsDefault" runat="server" />
                    </td>
                </tr>--%>
            </table>
        </asp:View>
        <asp:View ID="AddListValue" runat="server">
            <table>
                <tr>
                    <td>
                        <dnn:Label ID="llocale" runat="server" ResourceKey="llocale" Suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllocale" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddllocale_SelectedIndexChanged" Width="306px"></asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="lScope" runat="server" ResourceKey="lScope" Suffix=":" />
                    </td>
                    <td>
                        <dnn:Label ID="lSelectedScope" runat="server" />
                    </td>
                </tr>
                <%--<tr>
                    <td>
                        <dnn:Label ID="lSelectedListName" runat="server" ResourceKey="lSelectedListName" Suffix=":" />
                    </td>
                    <td>
                        <dnn:Label ID="lListNameSelected" runat="server" />
                    </td>
                </tr>--%>
                <tr id="AllLocale" runat="server">
                    <td valign="top">
                        <dnn:Label ID="lListValue" runat="server" ResourceKey="lListValue" Suffix=":" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbAllLocaleValue" runat="server" TextMode="MultiLine" Width="290px" Height="130px"></asp:TextBox>
                        <div id="AllListValues" runat="server">
                        </div>
                    </td>
                </tr>
            </table>

        </asp:View>
    </asp:MultiView>
    <br />
    <table style="width: 100%">
        <tr>
            <td>

                <asp:LinkButton ID="lnkAddList" runat="server" resourcekey="AddList" CausesValidation="False" CssClass="mbutton" OnClick="lnkAddList_Click" />
                <asp:LinkButton ID="bListUpdate" runat="server" CssClass="mbutton" OnClick="bListUpdate_Click"></asp:LinkButton>
                <asp:LinkButton ID="bListDelete" runat="server" resourcekey="ListDelete" CssClass="mbutton" OnClick="bListDelete_Click"></asp:LinkButton>
                <asp:LinkButton ID="bBack" runat="server" CssClass="mbutton" resourceKey="bBack" OnClick="bBack_Click"></asp:LinkButton>
                <asp:LinkButton ID="bListCancel" runat="server" CssClass="mbutton2" resourceKey="ListCancel" OnClick="bListCancel_Click"></asp:LinkButton></td>
        </tr>
    </table>

</div>
