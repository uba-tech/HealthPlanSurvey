<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Resource_jQueryFileUpload.ascx.cs" Inherits="DNNGo.Modules.xPlugin.Resource_jQueryFileUpload1" %>

<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
<link rel="stylesheet" href="<%=ModulePath %>Resource/jQueryFileUpload/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript>
	<link rel="stylesheet" href="<%=ModulePath %>Resource/jQueryFileUpload/jquery.fileupload-ui-noscript.css">
</noscript>

<div id="fileupload">
    <form action="<%=ModulePath %>Resource_jQueryFileUpload.ashx?<%=QueryString %>" method="post" enctype="multipart/form-data">
        <div class="fileupload-buttonbar">
            <span class="btn btn-success fileinput-button"> <i class="glyphicon glyphicon-plus"></i> <span><%=ViewResourceText("Title_Add", "Add files...")%></span>
				<input type="file" name="files[]" multiple />
			</span>

            <button type="submit" class="btn btn-primary start">
				<i class="glyphicon glyphicon-upload"></i>
				<span><%=ViewResourceText("Title_Start", "Start upload")%></span>
			</button>
			<button type="reset" class="btn btn-warning cancel">
				<i class="glyphicon glyphicon-ban-circle"></i>
				<span><%=ViewResourceText("Title_Cancel", "Cancel upload")%></span>
			</button>

            <button type="button" class="btn btn-danger delete">
				<i class="glyphicon glyphicon-trash"></i>
				<span><%=ViewResourceText("Title_Delete", "Delete")%></span>
			</button>

                        <div class="fileupload-progressbar"></div>
        </div>
    </form>
    <div class="fileupload-content">
        <table class="files"></table>
    </div>
</div>
<script id="template-upload" type="text/x-jquery-tmpl">
    <tr class="template-upload{{if error}} ui-state-error{{/if}}">
        <td class="preview"></td>
        <td class="name">${name}</td>
        <td class="size">${sizef}</td>
        {{if error}}
            <td class="error" colspan="2">Error:
                {{if error === 'maxFileSize'}}File is too big
                {{else error === 'minFileSize'}}File is too small
                {{else error === 'acceptFileTypes'}}Filetype not allowed
                {{else error === 'maxNumberOfFiles'}}Max number of files exceeded
                {{else}}${error}
                {{/if}}
            </td>
        {{else}}
            <td class="progress">
                <div></div>
            </td>
            <td class="start">
                <button class="btn btn-primary start">
			        <i class="glyphicon glyphicon-upload"></i>
			        <span>Start</span>
			    </button>
            </td>
        {{/if}}
        <td class="cancel">
            <button class="btn btn-warning cancel">
			    <i class="glyphicon glyphicon-ban-circle"></i>
			    <span>Cancel</span>
			</button>

        </td>
    </tr>
</script>
<script id="template-download" type="text/x-jquery-tmpl">
    <tr class="template-download{{if error}} ui-state-error{{/if}}">
        {{if error}}
            <td></td>
            <td class="name">${name}</td>
            <td class="size">${sizef}</td>
            <td class="error" colspan="2">Error:
                {{if error === 1}}File exceeds upload_max_filesize (php.ini directive)
                {{else error === 2}}File exceeds MAX_FILE_SIZE (HTML form directive)
                {{else error === 3}}File was only partially uploaded
                {{else error === 4}}No File was uploaded
                {{else error === 5}}Missing a temporary folder
                {{else error === 6}}Failed to write file to disk
                {{else error === 7}}File upload stopped by extension
                {{else error === 'maxFileSize'}}File is too big
                {{else error === 'minFileSize'}}File is too small
                {{else error === 'acceptFileTypes'}}Filetype not allowed
                {{else error === 'maxNumberOfFiles'}}Max number of files exceeded
                {{else error === 'uploadedBytes'}}Uploaded bytes exceed file size
                {{else error === 'emptyResult'}}Empty file upload result
                {{else}}${error}
                {{/if}}
            </td>
        {{else}}
            <td class="preview">
                {{if thumbnail_url}}
                    <a title="${name}" href="${url}" target="_blank"><img src="${thumbnail_url}" style="max-width:80px;max-height:80px;"></a>
                {{/if}}
            </td>
            <td class="name">
                <a title="${name}" href="${url}"{{if thumbnail_url}} target="_blank"{{/if}}>${name}</a>
            </td>
            <td class="size">${sizef}</td>
            <td colspan="2"></td>
        {{/if}}
        <td class="delete">
            <button data-type="${delete_type}" data-url="${delete_url}"  class="btn btn-danger delete">
                <i class="glyphicon glyphicon-trash"></i>
			    <span>Delete</span>
            </button>
        </td>
    </tr>
</script>
 
<script src="<%=ModulePath %>Resource/js/jquery.tmpl.min.js"></script>
<script src="<%=ModulePath %>Resource/jQueryFileUpload/jquery.iframe-transport.js"></script>
<script src="<%=ModulePath %>Resource/jQueryFileUpload/jquery.fileupload.js"></script>
<script src="<%=ModulePath %>Resource/jQueryFileUpload/jquery.fileupload-ui.js"></script>
<%--<script src="<%=ModulePath %>Resource/jQueryFileUpload/application.js"></script>--%>

<script type="text/javascript">
    jQuery(function ($) {
        'use strict';

        // Initialize the jQuery File Upload widget:
        $('#fileupload').fileupload({
            autoUpload: false,
            maxFileSize: 9999999999,
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png|txt|doc?|xls?|ppt?|zip|rar|mp3|mp4|flv|mkv)$/i
//            submit: function (e, data) { alert('上传完成'); }
        });

        // Load existing files:
        $.getJSON($('#fileupload form').prop('action'), function (files) {
            var fu = $('#fileupload').data('fileupload');
            fu._adjustMaxNumberOfFiles(-files.length);
            fu._renderDownload(files)
            .appendTo($('#fileupload .files'))
            .fadeIn(function () {
                // Fix for IE7 and lower:
                $(this).show();
            });
        });

        // Open download dialogs via iframes,
        // to prevent aborting current uploads:
        $('#fileupload .files a:not([target^=_blank])').live('click', function (e) {
            e.preventDefault();
            $('<iframe style="display:none;"></iframe>')
            .prop('src', this.href)
            .appendTo('body');
        });

    });
</script>
