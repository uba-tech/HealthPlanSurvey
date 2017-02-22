<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Design.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Admin.Design" %>
<%@ Register Assembly="Mandeeps.Web" Namespace="Mandeeps.Web.UI.WebControls" TagPrefix="Mandeeps" %>
<div class="LiveForm">
    <asp:Literal runat="server" ID="lSubmissioninfo"></asp:Literal>
    <Mandeeps:TabStrip runat="server" ID="ManageForm" Theme="Settings" ThemePath="~/DesktopModules/LiveForms/Resources/Tabs"
        SelectedIndex="1">
        <Mandeeps:Tab ID="SubmissionTab" runat="server">
        </Mandeeps:Tab>
        <Mandeeps:Tab ID="DesignerTab" runat="server">
            <div id="Designer">
                <div id="Toolbar">
                    <div id="Basic"></div>
                    <div id="Properties">
                        <div id="Properties-Inner"></div>
                    </div>
                        <div id="Properties-Nav">
                            <button type="button" id="navStyling" class="Toolbar-Nav-Item" style="float: left;"><span class="glyphicon glyphicon-pencil"></span><br /><span class="Toolbar-Text" style="">Styling</span></button>
                            <button type="button" id="navActions" class="Toolbar-Nav-Item" style="float: left;"><span class="glyphicon glyphicon-cog"></span><br /><span class="Toolbar-Text" style="">Options</span></button>
                            <button type="button" id="navSharing" class="Toolbar-Nav-Item" style="float: left;"><span class="glyphicon glyphicon-share-alt"></span><br /><span class="Toolbar-Text " style="">Sharing</span></button>
                            <button type="button" id="navField" class="Toolbar-Nav-Item" style="float: left; display: none"><span class="Toolbar-Text" style="">Field: Properties</span></button>
                        </div>
                    </div>
                
                <div id="Toolbox">
                </div>
                <div id="Stage">
                    <div id="LiveForm100" class="LiveForm Default" uniqueid="LiveForm100">
                        <div class="drop-msg" id="dropmsg" runat="server">
                        <asp:Label ID="lblDropFile" runat="server"></asp:Label>
                            </div>                      
                        <ul>
                        </ul>
                    </div>
                </div>
            </div>
        </Mandeeps:Tab>
    </Mandeeps:TabStrip>
</div>
