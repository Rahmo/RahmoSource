function confirmSave(id, content,posturl) {
    preview();
    if (content == "") {
        $("<div title=\"Warning\"><h3>The content cannot be empty!</h3></div>").dialog({
            width: 200,
            modal: true,
            buttons: {
                Ok: function () {
                    $(this).dialog("close");
                    $(this).remove();
                }
            }
        });
        return false;
    }
    $("<div title=\"Confirm\"><h3>Do you want to save the content to the server?</h3></div>").dialog({
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                $(this).dialog("close");
                $(this).remove();
                saveWebPageToServer(id, content,posturl);
            },
            No: function () {
                $(this).dialog("close");
                $(this).remove();
            }
        }
    });

}
function saveWebPageToServer(id, content,posturl) {
    $.ajax({
        url: posturl,
        data: { id: id, content: content },
        datatype: "json",
        type: "POST",
        error: function () {
            $("<div title=\"Warning\"><h3>System Error!</h3></div>").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                        $(this).remove();
                    }
                }
            });
        },
        beforeSend: function () {
            $("<div id=\"submitting\" style=\"text-align:center;padding-top:20px;\"><img src=\"/Images/ajax-loader_bar.gif\"/><br />Submitting...</div>").dialog({
                modal: true,
                height: 100,
                create: function (event, ui) {
                    $(this).siblings(".ui-dialog-titlebar").remove();
                }
            });
        },
        complete: function () {
            $("#submitting").remove();
        },
        success: function (data) {
            if (data != true && data != false) {
                $("<div title=\"Warning\"><h3>Your login session is expired!</h3>Please do not close this page, or you will lose all changes. After relogined, please try to submit one more time.</div>").dialog({
                    width: 400,
                    modal: true,
                    buttons: {
                        Login: function () {
                            $(this).dialog("close");
                            $(this).remove();
                            window.open("/SHTracker");
                        },
                        Cancel: function () {
                            $(this).dialog("close");
                            $(this).remove();
                        }
                    }
                });
                return false;
            }
            if (data == false) {
                $("<div title=\"Warning\"><h3>System Error!</h3></div>").dialog({
                    modal: true,
                    buttons: {
                        Ok: function () {
                            $(this).dialog("close");
                            $(this).remove();
                        }
                    }
                });
                return false;
            }
            if (data == true) {
                $("<div title=\"Message\"><h3>Updated Successfully!</h3></div>").dialog({
                    modal: true,
                    buttons: {
                        Ok: function () {
                            $(this).dialog("close");
                            $(this).remove();
                        }
                    }
                });
            }
            return true;
        }
    });
    return false;
}

function editing() {
    $('#editable').attr('contenteditable', 'true');
    CKEDITOR.inline('editable');
    $('#editable').focus();
}

function preview() {
    $('#editable').removeAttr('contenteditable');
    if (CKEDITOR.instances.editable) CKEDITOR.instances.editable.destroy();
}