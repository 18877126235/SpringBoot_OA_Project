<!-- 必要 -->
	<script charset="utf-8" src="plugins/kindeditor/lang/zh_CN.js"></script>
	<!-- 必要 -->
	<script charset="utf-8" src="plugins/kindeditor/kindeditor-min.js"></script>
	
	<!-- 这里可能实在js代码中授予富文本的权限-->
	<!-- 这里可能实在js代码中授予富文本的权限
		<script type="text/javascript" src="js/mail/mail.js" ></script>
	 -->
	 



<!-- 评论回复帖子模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" style="margin-top: 10%";>
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<span class="glyphicon glyphicon-remove-circle" style="font-size: 26px;"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					评论
				</h4>
			</div>
			
			<!--  <textarea name="content" placeholder="在此处填写内容...." class="form-control tent" style="width: 100%; height: 360px;  font-size: 20px;"></textarea>
			
				<textarea class="contentfuwenben" style="width: 100%; height: 360px; rows="8" cols="78" id="comment"></textarea>
			-->	
			
			
			<div class="modal-body" >
				<textarea class="contentfuwenben" style="width: 100%; height: 360px; rows="8" cols="78" id="comment"></textarea>
			</div>
			
			<input type="hidden" id="commentid"/>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="commentsave" data-dismiss="modal">提交	</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<script type="text/javascript">

//开启富文本
var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[class="contentfuwenben"]', {
		allowFileManager: true
	});
	K('input[name=getHtml]').click(function(e) {
		alert(editor.html());
	});
	K('input[name=isEmpty]').click(function(e) {
		alert(editor.isEmpty());
	});
	K('input[name=getText]').click(function(e) {
		alert(editor.text());
	});
	K('input[name=selectedHtml]').click(function(e) {
		alert(editor.selectedHtml());
	});
	K('input[name=setHtml]').click(function(e) {
		editor.html('<h3>Hello KindEditor</h3>');
	});
	K('input[name=setText]').click(function(e) {
		editor.text('<h3>Hello KindEditor</h3>');
	});
	K('input[name=insertHtml]').click(function(e) {
		editor.insertHtml('<strong>插入HTML</strong>');
	});
	K('input[name=appendHtml]').click(function(e) {
		editor.appendHtml('<strong>添加HTML</strong>');
	});
	K('input[name=clear]').click(function(e) {
		editor.html('');
	});

});


KindEditor.sync();

</script>


