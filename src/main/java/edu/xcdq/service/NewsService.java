package edu.xcdq.service;

import edu.xcdq.bean.News;

import java.util.List;

public interface NewsService {
    //分页获取新闻信息列表
    public List<News> getPageNewsList(int pageNo, int pageSize);
    // 查询新闻信息
    public List<News> getNewsList();

    // 增加新闻信息
    public boolean add(News news) ;

    //根据新闻ID查询新闻信息
    public News getNewsById(int id);

    //获取新闻总数量
    public int getTotalCount();
    // 删除新闻信息
    public boolean delete(News news);
}
