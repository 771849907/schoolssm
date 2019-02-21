package com.dzh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzh.bean.Article;
import com.dzh.dao.ArticleMapper;

@Service
public class ArticleService {
	
	@Autowired
	ArticleMapper articleMapper;

	/**
	 * 向数据库插入发帖信息
	 * @param article
	 */
	public void setArticle(Article article) {
		
		articleMapper.insert(article);
	}

	/**
	 * 查询发帖表信息（无条件）
	 * @return
	 */
	public List<Article> getArticle() {
		
		return articleMapper.selectByArticle();
	}
	
	/**
	 * 按帖子标题模糊查询（搜索框搜索）
	 * @param articleTitle
	 * @return
	 */
	public List<Article> getArticleTitle(String articleTitle) {
		
		return articleMapper.selectByArticleTitle(articleTitle);
	}
	
	/**
	 * 按帖子板块查询出帖子
	 * @param bname
	 * @return
	 */
	public List<Article> getArticleBname(String bname) {

		return articleMapper.selectByArticleBname(bname);
	}

	/**
	 * 按userid查询发帖表信息
	 * @return
	 */
	public List<Article> getArticleId(int userid) {
		
		return articleMapper.selectByArticleId(userid);
	}

	/**
	 * 按fid查询发帖表信息
	 * @return
	 */
	public Article getArticleKey(int fid) {
		
		return articleMapper.selectByPrimaryKey(fid);
	}

	/**
	 * 按fid删除帖子
	 * @param fid
	 */
	public void deleteArticle(int fid) {

		articleMapper.deleteByPrimaryKey(fid);
	}

	/**
	 * 修改帖子表
	 * @param article
	 */
	public void updateArticle(Article article) {
		
		articleMapper.updateByPrimaryKey(article);
	}

	/**
	 * 修改article表的status属性（修改审核状态）
	 * @param article
	 */
	public void updateArticleStatus(Article article) {
		
		articleMapper.updateArticleStatus(article);
	}

	/**
	 * 删除用户对应的帖子信息(按userid)
	 * @param userid
	 */
	public void deleteArticleUserid(int userid) {
		
		articleMapper.deleteByUserid(userid);
	}

	/**
	 * 修改article表中的username
	 * @param userid
	 */
	public void updateArticleSetup(Article article) {
		
		articleMapper.updateArticleSetup(article);
	}

	
}
