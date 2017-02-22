<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImagePicker.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Controls.ImagePicker" %>
<%@ Register TagPrefix="dnn" TagName="UrlControl" Src="~/controls/UrlControl.ascx" %>
<dnn:UrlControl id="urlImagePicker" runat="server" ShowLog="false" ShowTrack="false"
    ShowNewWindow="false" UrlType="F" ShowUrls="false" ShowTabs="false" FileFilter="jpg,jpeg,png,gif">
</dnn:UrlControl>
<div id="ImagePicker">
</div>

<%--<script>
    (function ($) {
        $.QueryString = (function (a) {
            if (a == "") return {};
            var b = {};
            for (var i = 0; i < a.length; ++i) {
                var p = a[i].split('=');
                if (p.length != 2) continue;
                b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
            }
            return b;
        })(window.location.search.substr(1).split('&'))
    })(jQuery);
    $('.thumbnail.selected img').ready(function () {
        setTimeout(function () { $('.thumbnail').removeClass('selected'); $('.thumbnail img[src="' + parent.Utils.GetImage() + '"]').parent().addClass('selected'); }, 250);
    });
</script>--%>
<a class="mbutton" style="margin: 20px;" onclick="parent.Utils.ClosePopup('HandleImage',$('.thumbnail.selected img').attr('src')); ">Select File</a>
 <asp:LinkButton ID="bCancel" runat="server" CssClass="mbutton2" resourceKey="bCancel" OnClick="bCancel_Click"></asp:LinkButton>
