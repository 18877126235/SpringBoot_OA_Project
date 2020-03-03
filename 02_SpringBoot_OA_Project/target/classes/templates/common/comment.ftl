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
			
			<div class="modal-body" >
			
				<textarea name="content" placeholder="在此处填写内容...." id="comment" class="form-control tent" style="width: 100%; height: 360px;  font-size: 20px;"></textarea>
			
			</div>
			
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary motaikuangtijiao" id="commentsave" data-dismiss="modal">提交	</button>
			</div>
			<input type="hidden" id="commentid"/>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<script type="text/javascript">



</script>