var iframe = null;
var iframeContent = null;

CKEDITOR.plugins.add('CodePlugin',
{
	requires: ['iframedialog'],
    init: function (editor) {
        // Add the link and unlink buttons.
        editor.addCommand('CodePlugin', new CKEDITOR.dialogCommand('CodePlugin')); //定義dialog，也就是下面的code
        editor.ui.addButton('Code',     //定義button的名稱及圖片,以及按下後彈出的dialog
        {                               //這裡將button名字取叫'Code'，因此剛剛上方的toolbar也是加入名為Code的按鈕
            label: '圖片管理',
            icon: '/images/icon/codeicon.png',
            command: 'CodePlugin'
        });

        var me = this;
        CKEDITOR.dialog.add( 'CodePlugin', function ()
        {
           return {
              title : '圖片管理',
              minWidth : 400,
              minHeight : 200,
              contents :
                    [
                       {
                          id : 'iframe',
                          label : '選擇圖片',
                          expand : true,
                          elements :
                                [
                                   {
                                      type : 'iframe',
                                      src : './images',
                                      width : '100%',
                                      height : '100%',
                                      onContentLoad : function() {
										 iframe = document.getElementById( this._.frameId );
										 iframeContent = iframe.contentWindow.document;
                                      }
                                   }
                                ]
                       }
                    ],
              onOk : function()
              {
				 var image = iframeContent.getElementById('selectimage').value;
				 
				 if(image!=""){
					editor.insertHtml('<img src="' + image + '" />');
				 }
              }
           };
        } );
    }
})