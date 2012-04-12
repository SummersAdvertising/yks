var iframe = null;
var iframeWindow = null;
CKEDITOR.plugins.add('CodePlugin',
{
	requires: ['iframedialog'],
    init: function (editor) {
        // Add the link and unlink buttons.
        editor.addCommand('CodePlugin', new CKEDITOR.dialogCommand('CodePlugin')); //定義dialog，也就是下面的code
        editor.ui.addButton('Code',     //定義button的名稱及圖片,以及按下後彈出的dialog
        {                               //這裡將button名字取叫'Code'，因此剛剛上方的toolbar也是加入名為Code的按鈕
            label: '插入高亮程式碼',
            icon: '/images/icon/codeicon.png',
            command: 'CodePlugin'
        });

        var me = this;
        CKEDITOR.dialog.add( 'CodePlugin', function ()
        {
           return {
              title : 'YouTube Dialog',
              minWidth : 550,
              minHeight : 200,
              contents :
                    [
                       {
                          id : 'iframe',
                          label : 'Insert YouTube Movie...',
                          expand : true,
                          elements :
                                [
                                   {
                                      type : 'iframe',
                                      src : '../images',
                                      width : '100%',
                                      height : '100%',
                                      onContentLoad : function() {
										 iframe = document.getElementById( this._.frameId );
										iframeWindow = iframe.contentWindow;
                                      }
                                   }
                                ]
                       }
                    ],
              onOk : function()
              {
                 editor.insertHtml('a' + iframe.$('#test').value);
              }
           };
        } );
    }
})