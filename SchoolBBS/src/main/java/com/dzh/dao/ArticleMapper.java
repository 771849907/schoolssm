package com.dzh.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.dzh.bean.Article;

public interface ArticleMapper {

	//按fid删除帖子
	int deleteByPrimaryKey(Integer fid);

	//向数据库插入发帖信息
	int insert(Article record);

	int insertSelective(Article record);

	// 查询发帖表信息（无条件）
	List<Article> selectByArticle();
	
	//按帖子标题模糊查询（搜索框搜索）
	List<Article> selectByArticleTitle(String articleTitle);
	
	//按帖子板块查询出帖子
	List<Article> selectByArticleBname(String bname);

	// 按userid查询发帖表信息
	List<Article> selectByArticleId(int userid);

	//按fid查询发帖表信息
	Article selectByPrimaryKey(Integer fid);

	int updateByPrimaryKeySelective(Article record);

	//修改帖子表
	int updateByPrimaryKey(Article record);
	
	//修改article表的status属性（修改审核状态）
	int updateArticleStatus(Article record);

	//删除用户对应的帖子信息(按userid)
	void deleteByUserid(int userid);

	//修改article表中的username
	void updateArticleSetup(Article article);

	
}