/**
 * 评论删除确认框
 * @returns
 */
function p_del() { 
	var msg = "您真的确定要删除此条评论吗？\n\n删除后不能复原！"; 
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	}
}

/**
 * 帖子删除确认框
 * @returns
 */
function f_del() { 
	var msg = "您真的确定要删除此条帖子吗？\n\n这将同时删除这条帖子下的所有评论。\n\n删除后不能复原！"; 
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	}
}

/**
 * 板块删除确认框
 * @returns
 */
function b_del() { 
	var msg = "您真的确定要删除此条板块吗？\n\n删除后不能复原！"; 
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	}
}

