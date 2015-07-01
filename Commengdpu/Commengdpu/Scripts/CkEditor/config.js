/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    config.extraPlugins = "autogrow,imagebrowser,filebrowser";
    /*config autogrow*/
    config.autoGrow_maxHeight = 400;
    /*config autogrow end*/
    /*config imagebrowser*/
    //config.imageBrowser_listUrl = "";
    /*config imagebrowser end*/

    /*config filebrowser*/
    config.filebrowserImageBrowseUrl = '/Admin/CKEditor/Browse?type=Images';
    config.filebrowserImageUploadUrl = '/Admin/CKEditor/FileUpload?type=Images';
    config.filebrowserBrowseUrl = '/Admin/CKEditor/Browse?type=docs';
    config.filebrowserUploadUrl = '/Admin/CKEditor/FileUpload?type=docs';
    config.filebrowserImageWindowWidth = 640;
    config.filebrowserImageWindowHeight = 480;
    /*config filebrowser end*/
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.skin = 'Moono';
    config.disableNativeSpellChecker = false;
};
