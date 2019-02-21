var _content = []; // 临时存储。show_article循环内容
var jq22 = {
	_default : 4, // 默认显示帖子个数
	_loading : 3, // 每次点击按钮后加载的个数
	init : function() {
		var lis = $(".jq22 .hidden .show_article");
		$(".jq22 div.list").html("");
		for (var n = 0; n < jq22._default; n++) {
			lis.eq(n).appendTo(".jq22 div.list");
		}
		$(".jq22 div.list .show_article_go").each(function() {
			$(this).attr('src', $(this).attr('realSrc'));
		})
		for (var i = jq22._default; i < lis.length; i++) {
			_content.push(lis.eq(i));
		}
		$(".jq22 .hidden").html("");
	},
	loadMore : function() {
		var mLis = $(".jq22 div.list .show_article").length;
		for (var i = 0; i < jq22._loading; i++) {
			var target = _content.shift();
			if (!target) {
				$('.jq22 .more').html("<p class='text-danger'>没有更多帖子了...</p>");
				break;
			}
			$(".jq22 div.list").append(target);
			$(".jq22 div.list show_article_go").eq(mLis + i).each(function() {
				$(this).attr('src', $(this).attr('realSrc'));
			});
		}
	}
}
jq22.init();