package edu.xcdq.dao;
import java.util.List;
import edu.xcdq.bean.News;
import edu.xcdq.bean.NewsCategory;

public interface NewsDao {

	// 查询新闻信息
	public List<News> getNewsList();

	// 增加新闻信息
	public boolean add(News news) ;
	// 修改新闻标题
	public void update(News news);
	// 删除新闻信息
	public boolean delete(News news);

	// 查找特定标题的新闻信息
	public void getNewsByTitle(News news);
	
	//获取某类别下新闻总数量
	public int getCountByCategory(NewsCategory category);
	
	//根据新闻ID得到新闻信息
	public News getNewsById(int id);
	
	//获取新闻总数量
	public int getTotalCount();
	
	//分页获取新闻信息
	public List<News> getPageNewsList(int pageNo, int pageSize);
}
