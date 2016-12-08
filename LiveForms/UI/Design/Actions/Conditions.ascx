<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Conditions.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.Conditions" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<script type="text/javascript">
    var Conditions = {
        HandlerURL: '',
        UlControlID: "#<%=phConditionSet.ClientID%>",
        GetArrayConditionSet: function () {
            var Items = new Array();
            jQuery(Conditions.UlControlID + " li").each(function (index, value) {
                if (!jQuery(value).hasClass('multiple-condition')) {
                    var Condition_Control = jQuery("#" + value.attributes["id"].value + " [id^='ddlConditionControl']").val();
                    var Field_Control = jQuery("#" + value.attributes["id"].value + " [id^='ddlField']").val();
                    var Condition_Value = jQuery("#" + value.attributes["id"].value + " [id^='ddlConditionValue']");
                    if (!(Condition_Value.length > 0))
                        Condition_Value = jQuery("#" + value.attributes["id"].value + " [id^='inputConditionValue']");
                    Condition_Value = Condition_Value.val();

                    Items.push({
                        FieldGuid: Field_Control,
                        FieldCondition: Condition_Control,
                        FieldValue: Condition_Value
                    });
                }
                else if (jQuery(value).hasClass('multiple-condition')) {
                    var multiplecondition = jQuery(".multiple-condition [id^='ddlMultipleCondition']");
                    if (multiplecondition.length > 0) {
                        Items.push({
                            FieldGuid: 'multiple',
                            FieldCondition: 'multiple',
                            FieldValue: multiplecondition.val()
                        });
                    }
                }
            });
            $("#" + "<%=MaintainConditonOnPostback.ClientID%>").val(JSON.stringify(Items));
            return Items;
        },
        SaveConditionSet: function () {
            var Items = Conditions.GetArrayConditionSet();
            var cData = JSON.stringify(Items);
            jQuery("#" + "<%=conditiondata.ClientID%>").val(cData);

            
            return true;
        },
        BindConditionSet: function (ConditionSetId) {
            var i;
            var MatchValue = null;
            Conditions.UpdateExecuteHiddenValue();
            var cs = $("#" + "<%=MaintainConditonOnPostback.ClientID%>").val();

           if (typeof cs !== "undefined" && cs.length > 0) {
               Conditions.PrepareConditionSet(JSON.parse(cs));
               Conditions.MaintainExecuteOption();
           }
           else if (ConditionSetId && ConditionSetId.length > 0 && typeof cs != 'undefined' && cs != "[]") {
               $.ajax({
                   url: Conditions.HandlerURL + "&Action=GetConditionSet&csid=" + ConditionSetId,
                   type: 'get',
                   async: false,
                   success: function (data) {
                       if (data != null && data != "null") {
                           var json = JSON.parse(data);
                           Conditions.PrepareConditionSet(json);

                       }
                       else {
                           Conditions.PrepareConditionSet(cs);
                       }

                   }
               });
           }
           else {
               Conditions.RenderConditionSet();
           }
           jQuery("#<%=LastIndex.ClientID%>").val(jQuery(Conditions.UlControlID + " li").length);
        },
        PrepareConditionSet: function (ConditionSets) {
            if (typeof ConditionSets === "object") {
                jQuery(ConditionSets).each(function (index, value) {

                    if (typeof value.ExecuteCondition != "undefined")
                    {
                        jQuery("#" + "<%=ddlExecuteOptions.ClientID%>").val(value.ExecuteCondition);
                        Conditions.UpdateExecuteHiddenValue();
                    }

                    if (value.FieldGuid !== "multiple") {
                        var li = Conditions.RenderConditionSet();
                        jQuery("#" + li.attr("id") + " [id^='ddlField']").val(value.FieldGuid);
                        jQuery("#" + li.attr("id") + " [id^='ddlField']").change();
                        jQuery("#" + li.attr("id") + " [id^='ddlConditionControl']").val(value.FieldCondition);
                        jQuery("#" + li.attr("id") + " [id^='ddlConditionControl']").change();
                        jQuery("#" + li.attr("id") + " [id^='ddlConditionValue']").val(value.FieldValue);
                        jQuery("#" + li.attr("id") + " [id^='inputConditionValue']").val(value.FieldValue);

                        if (jQuery(Conditions.UlControlID + " li").hasClass('multiple-condition'))
                            jQuery(Conditions.UlControlID + " li").find('select[id*="ddlMultipleCondition"]').val(value.MatchCondition);

                    }
                    else {
                        if (jQuery(Conditions.UlControlID + " li").hasClass('multiple-condition'))
                            console.log(jQuery(Conditions.UlControlID + " li").find('select[id*="ddlMultipleCondition"]').val(value.FieldValue));
                    }
                });
            }
            else {
                Conditions.RenderConditionSet();
            }
        },
        ClearIndex: function () {
            jQuery("#<%=LastIndex.ClientID%>").val("");
        },
        RenderConditionSet: function () {
            var li = $("<li></li>");
            var SpanIF = $("<span><b>IF   </b></span>")
            var SpanField = $("<span><b>  Field    </b></span>")
            var IndexId = Conditions.GetNextId();
            li.attr("Id", "CondtionSet" + IndexId);
            var ddlField = $("<select></select>");
            ddlField.attr("Id", "ddlField" + IndexId);
            var ddlCondition = $("<select></select>");
            ddlCondition.attr("Id", "ddlConditionControl" + IndexId);
            Conditions.PopulateConditions(ddlField, ddlCondition, "GetConditions");

            var spanCondition = $("<span></span>");
            spanCondition.attr("Id", "sCondition" + IndexId);
            spanCondition.append(ddlField);
            var spanFields = $("<span></span>");
            spanFields.attr("Id", "sFields" + IndexId);
            spanFields.append(ddlCondition);
            li.append(SpanIF).append(spanCondition);
            li.append(SpanField).append(spanFields);
            if (jQuery(Conditions.UlControlID + " li").hasClass("multiple-condition")) {
                jQuery(Conditions.UlControlID + " li.multiple-condition").before(li);
            }
            else {
                jQuery(Conditions.UlControlID).append(li);
            }
            if (Conditions.NextIndex() > 1 && !jQuery(Conditions.UlControlID + " li").hasClass('multiple-condition')) {
                var mli = $("<li></li>");
                var SpanMessageFirst = $("<span><b>IF</b></span>");
                var SpanMessageSecond = $("<span><b> of these rules are matched: </b></span>");
                //mli.attr("Id", "CondtionSet" + IndexId);
                mli.attr("class", "multiple-condition")
                var ddlMultipleCondition = $("<select></select>");
                ddlMultipleCondition.attr("Id", "ddlMultipleCondition" + IndexId);
                jQuery("<option />", {
                    val: 'Any',
                    text: 'Any'
                }).appendTo(ddlMultipleCondition);
                jQuery("<option />", {
                    val: 'All',
                    text: 'All'
                }).appendTo(ddlMultipleCondition);
                var spanMultipleCondition = $("<span></span>");
                spanMultipleCondition.attr("Id", "sMultipleCondition" + IndexId);
                spanMultipleCondition.append(SpanMessageFirst).append(ddlMultipleCondition).append(SpanMessageSecond);
                mli.append(spanMultipleCondition);
                jQuery(Conditions.UlControlID).append(mli)
            }
            var DeleteButton = $("<a></a>");
            DeleteButton.attr("onClick", "Conditions.Delete(this)");
            DeleteButton.attr("title", "Delete");
            DeleteButton.attr("class", "mdelete");
            li.append(DeleteButton);
            return li;
        },

        PopulateConditions: function (ddlCondition, ddlField, Action) {
            jQuery(ddlCondition).append($("<option></option>").val("").html("Please Select"));
            var selectedcontrol = jQuery(ddlCondition).val();
            var Parameter = '';
            if (selectedcontrol.length > 0)
                Parameter = "&fid=" + selectedcontrol;
            $.ajax({
                url: Conditions.HandlerURL + "&Action=" + Action + Parameter,
                type: 'get',
                async: false,
                success: function (data) {
                    if (data.length > 0) {
                        var json = JSON.parse(data);
                        jQuery(json).each(function (index, value) {
                            jQuery(ddlCondition).append($("<option></option>").val(value.Key).html(value.Value));
                        });
                    }
                }
            });
            jQuery(ddlField).hide();
            jQuery(ddlCondition).change(function () {
                Conditions.PopulateFields(ddlCondition, ddlField, "GetFields");
            });

        },
        Delete: function (ID) {
            if (confirm('Do you want to delete Condition'))
                $(ID.parentNode).remove();
            if (jQuery(Conditions.UlControlID + " li").size() <= 2) {
                jQuery(Conditions.UlControlID + " .multiple-condition").remove();
            }
        },
        PopulateFields: function (ddlCondition, ddlField, Action) {
            jQuery(ddlField).empty();
            jQuery(ddlField).hide();
            jQuery(ddlField).change();
            var ValueClass = "ConditionValue" + jQuery(Conditions.UlControlID + " #" + jQuery(ddlField).parent().parent().attr("id")).index();
            $("#" + jQuery(ddlField).parent().parent().attr("id") + " a").remove();
            jQuery("<option />", {
                val: "",
                text: "Please Select"
            }).appendTo(ddlField);
            var selectedcontrol = jQuery(ddlCondition).val();
            var Parameter = '';

            if (selectedcontrol.length > 0) {
                Parameter = "&fid=" + selectedcontrol;
                $.ajax({
                    url: Conditions.HandlerURL + "&Action=" + Action + Parameter,
                    type: 'get',
                    async: false,
                    success: function (data) {
                        if (data.length > 0) {
                            var json = JSON.parse(data);
                            jQuery(json).each(function (index, value) {
                                jQuery(ddlField).show().css('display', 'inline-block');
                                jQuery("<option />", {
                                    val: value.Key,
                                    text: value.Value
                                }).appendTo(ddlField);
                            });
                        }
                    }
                });
            }
            jQuery(ddlField).change(function () {
                var selectedcontrol = jQuery(ddlCondition).val();
                var Parameter = '';
                if (selectedcontrol.length > 0) {
                    Parameter = "&fid=" + selectedcontrol;
                    $.ajax({
                        url: Conditions.HandlerURL + "&Action=GetFieldValue" + Parameter,
                        type: 'get',
                        async: false,
                        success: function (data) {
                            jQuery("#" + jQuery(ddlField).parent().parent().attr("id") + " [id^='sConditionValue']").remove();
                            var selectedField = jQuery("#" + ddlField.attr("id") + " option:selected");
                            if (selectedField.text() == "" || selectedField.val().toLowerCase() == "isempty" || selectedField.val().toLowerCase() == "isfilled") {
                                var DeleteButton = $("<a></a>");
                                DeleteButton.attr("onClick", "Conditions.Delete(this)");
                                DeleteButton.attr("title", "Delete");
                                DeleteButton.attr("class", "mdelete");

                                var ValueClass = "ConditionValue" + jQuery(Conditions.UlControlID + " #" + jQuery(ddlField).parent().parent().attr("id")).index();
                                $("#" + jQuery(ddlField).parent().parent().attr("id") + " a").remove();
                                $("#" + jQuery(ddlField).parent().parent().attr("id")).append(DeleteButton);
                                return;
                            }
                            if (data.length > 0) {
                                var json = data;
                                var spanConditionValue = $("<span></span>");
                                spanConditionValue.attr("Id", "sConditionValue" + jQuery(Conditions.UlControlID + " #" + jQuery(ddlField).parent().parent().attr("id")).index());
                                try {
                                    json = JSON.parse(data);
                                    var ddlCondtionValue = $("<select></select>");
                                    ddlCondtionValue.attr("Id", "ddlConditionValue" + jQuery(Conditions.UlControlID + " #" + jQuery(ddlField).parent().parent().attr("id")).index());
                                    spanConditionValue.append(ddlCondtionValue);
                                    jQuery(json).each(function (index, value) {
                                        jQuery(ddlCondtionValue).show().css('display', 'inline-block');
                                        jQuery("<option />", {
                                            val: value,
                                            text: value
                                        }).appendTo(ddlCondtionValue);
                                    });
                                }
                                catch (ex) {
                                    var SelectedValue = $("#ddlConditionControl0 option:selected").val();
                                    var inputCondtionValue = $("<input/>");
                                    inputCondtionValue.attr("type", "text");
                                    inputCondtionValue.attr("Id", "inputConditionValue" + jQuery(Conditions.UlControlID + " #" + jQuery(ddlField).parent().parent().attr("id")).index());
                                    inputCondtionValue.attr("class", "ConditionValue" + jQuery(Conditions.UlControlID + " #" + jQuery(ddlField).parent().parent().attr("id")).index());
                                    if (data != "Datetime") {
                                        spanConditionValue.append(inputCondtionValue);
                                    }
                                    else if (data == "Datetime" && (SelectedValue == "IsEqualToDay" || SelectedValue == "NotEqualToDay")) {
                                        var Days = new Array('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
                                        var ddlCondtionValue = $("<select></select>");
                                        ddlCondtionValue.attr("Id", "ddlConditionValue" + jQuery(Conditions.UlControlID + " #" + jQuery(ddlField).parent().parent().attr("id")).index());
                                        spanConditionValue.append(ddlCondtionValue);
                                        jQuery(Days).each(function (index, value) {
                                            jQuery(ddlCondtionValue).show().css('display', 'inline-block');
                                            jQuery("<option />", {
                                                val: value,
                                                text: value
                                            }).appendTo(ddlCondtionValue);
                                        });
                                    }
                                    else {
                                        $(inputCondtionValue).datepicker();
                                        spanConditionValue.append(inputCondtionValue);
                                    }
                                }
                                jQuery("#" + jQuery(ddlField).parent().parent().attr("id")).append(spanConditionValue);
                                var DeleteButton = $("<a></a>");
                                if (jQuery(Conditions.UlControlID + " #" + jQuery(ddlField).parent().parent().attr("id")).index() < 2)
                                    DeleteButton.attr("onClick", "Conditions.Delete(this)");
                                else
                                    DeleteButton.attr("onClick", "Conditions.Delete(this)");
                                DeleteButton.attr("title", "Delete");
                                DeleteButton.attr("class", "mdelete");

                                var ValueClass = "ConditionValue" + jQuery(Conditions.UlControlID + " #" + jQuery(ddlField).parent().parent().attr("id")).index();
                                $("#" + jQuery(ddlField).parent().parent().attr("id") + " a").remove();
                                $("#" + jQuery(ddlField).parent().parent().attr("id")).append(DeleteButton);
                            }

                        }
                    });
                }

            });

        },
        IsValid: function (object) {
            if (Conditions.NextIndex() > 0) {
                var flag = true;
                jQuery(Conditions.UlControlID + " li").each(function (index, value) {
                    if (!jQuery(value).hasClass('multiple-condition')) {
                        var ddlCondition = jQuery("#" + value.attributes["id"].value + " [id^='ddlConditionControl']").val();
                        var ddlField = jQuery("#" + value.attributes["id"].value + " [id^='ddlField']").val();
                        var CompareValue = jQuery("#" + value.attributes["id"].value + " [id^='ddlConditionValue']");
                        if (!(CompareValue.length > 0))
                            CompareValue = jQuery("#" + value.attributes["id"].value + " [id^='inputConditionValue']");
                        CompareValue = CompareValue.val();
                        if (ddlField != "" && ddlCondition != "") {
                            if (CompareValue != "")
                                flag = true;
                            else {
                                flag = false;
                                alert("Please specified Compare Value");
                                return;
                            }
                        }
                        else {
                            if (object == "bSave" && typeof CompareValue == 'undefined' && ddlField == "") {
                                Conditions.SaveConditionSet();
                            }
                            else {
                                flag = false;
                                alert("Please select field");
                                return;
                            }
                        }
                    }
                });

                if (flag) {
                    if (Conditions.IsValidConditionSet()) {
                        if (object == "bSave") {
                            Conditions.SaveConditionSet();
                            return true;
                        }
                        else {
                            Conditions.RenderConditionSet();
                        }
                    }
                    else {
                        alert("Please specify valid conditions.");
                    }
                }
            }
            else if (Conditions.NextIndex() == 0) {
                Conditions.RenderConditionSet(); //double click to save condition after delete
            }
            return false;
        },
        IsValidConditionSet: function () {
            var items = Conditions.GetArrayConditionSet();
            var Valid = false;
            if (items.length == 1)
                return true;
            //for (var i = 0; i < items.length - 2 ; i++) {              
            //    var NewCondition = items[items.length - 2];
            //    if (items[i].FieldGuid == NewCondition.FieldGuid) {
            //if (items[i].FieldCondition == NewCondition.FieldCondition) {
            //    if (items[i].FieldValue == NewCondition.FieldValue) {
            //        Valid = false;
            //        return false;
            //    }
            //else {
            for (var i = 0; i <= items.length - 2 ; i++) {
                for (j = 0; j <= items.length - 2; j++) {
                    if (items[i].FieldValue == items[j].FieldValue && i != j && items[i].FieldCondition == items[j].FieldCondition && items[i].FieldGuid == items[j].FieldGuid) {
                        return false;
                    }
                }
            }
            //}
            //}
            // }        
            return true;

        },
        GetNextId: function () {
            var Index = jQuery("#<%=LastIndex.ClientID%>").val();
            Index = parseInt(Index);
            if (isNaN(Index))
                Index = 0;
            Index = Index + 1;
            jQuery("#<%=LastIndex.ClientID%>").val(Index);
            return Index;

        },
        NextIndex: function () {
            return jQuery(Conditions.UlControlID + " li").length;

        },

        UpdateExecuteHiddenValue: function () {

            var ExecuteOptions = document.getElementById("<%=ddlExecuteOptions.ClientID%>");
            if (ExecuteOptions != null) {
                var selectedOption = ExecuteOptions.options[ExecuteOptions.selectedIndex].value;

                jQuery("#" + "<%=ExecuteOption.ClientID%>").val(selectedOption);
            }

        },

        MaintainExecuteOption: function () {
            var value = $("#" + "<%=ExecuteOption.ClientID%>").val();

            if (value != "")
                jQuery("#" + "<%=ddlExecuteOptions.ClientID%>").val(value);
        }
    }
</script>
<style>
    .ExecuteOption{
        position: absolute;
        right: 285px;
        line-height: 28px;
        width: 89px!important
    }
    

</style>
<div class="LiveForm">
    <div id="divExecuteOptions" runat="server" style="text-align: right; padding-bottom: 5px;">
        <asp:Label ID="lExecuteOption" runat="server" CssClass="ExecuteOption" /><asp:DropDownList ID="ddlExecuteOptions" Width="256"  runat="server" onchange="Conditions.UpdateExecuteHiddenValue();"></asp:DropDownList><br />

        <div class="caption" style="margin-top: 10px; text-align:left">
         <asp:Label ID="lActionInfo" runat="server" />
        </div>
    </div>
    
    <div class="Conditions">
    <asp:HiddenField ID="MaintainConditonOnPostback" runat="server" />
    <asp:HiddenField ID="conditiondata" runat="server" />
    <asp:HiddenField ID="LastIndex" runat="server" />
    <asp:HiddenField ID="ExecuteOption" runat="server" />
    <ul id="phConditionSet" class="condition-set" runat="server"></ul>
    <a href="#" onclick="Conditions.IsValid(this);return false;" style="float: right;" class="mbutton2">Add New Condition</a>
    </div>
</div>

