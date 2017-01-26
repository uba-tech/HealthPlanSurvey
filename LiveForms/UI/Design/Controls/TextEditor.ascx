<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextEditor.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Controls.TextEditor" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%--<script type="text/javascript">
    
    function  Save_Text () {
        parent.Utils.ClosePopup('HandleText', $('.dnnTextEditor iframe').contents().find('body').html());
    }
    function Get_Text() {
        console.log(parent.Utils.GetText());
        console.log($('.dnnTextEditor iframe').contents().find('body'));
        //editor.set_html(parent.Utils.GetText());
        //var html = $(parent.Utils.GetText());
        $('.dnnTextEditor iframe').ready(function () {
            //alert('test');
            setTimeout(function () { $('.dnnTextEditor iframe').contents().find('body').html(parent.Utils.GetText()); }, 250);
        }); 

    }
    
    
    $(function () {
        Get_Text();
    });

</script>--%>
<style type="text/css">
    .dnnTooltip label {
        text-align: left;
    }
  
    .mbutton {
        font-family: Helvetica,Arial,sans-serif;
        padding: 5px 10px;
        background: #818181;
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#818181, endColorstr=#656565);
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#818181, endColorstr=#656565)";
        background: -webkit-gradient(linear, left top, left bottom, from(#818181), to(#656565));
        background: -moz-linear-gradient(center top, #818181 0%, #656565 100%) repeat scroll 0 0 transparent;
        border-color: #FFFFFF;
        border-radius: 3px;
        color: #FFFFFF !important;
        font-weight: bold;
        text-decoration: none;
        text-shadow: 0 1px 1px #000000;
        -moz-border-radius: 3px;
        webkit-border-radius: 3px;
    }

        .mbutton:hover {
            background: #4E4E4E;
            color: #ffffff;
            text-decoration: none;
        }

    .mbutton2 {
        font-weight: bold;
        padding: 8px;
        text-decoration: none;
        color: #003366;
    }

        .mbutton2:hover {
            text-decoration: underline;
            color: #000;
        }


     
</style>
<dnn:TextEditor ID="tbContent" runat="server" width="100%" height="400px" >
  </dnn:TextEditor>
<asp:LinkButton ID="bSave" runat="server" OnClick="bSave_Click" class="mbutton">Save</asp:LinkButton>
<asp:LinkButton ID="bCancel" runat="server" class="mbutton2" Text="Cancel" OnClick="bCancel_Click"></asp:LinkButton>
