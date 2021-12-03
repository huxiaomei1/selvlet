package edu.xcdq.service.impl;

import edu.xcdq.bean.News;
import edu.xcdq.dao.NewsDao;
import edu.xcdq.dao.impl.NewsDaoImpl;
import edu.xcdq.service.NewsService;

import java.util.List;

public class NewsServiceImpl implements NewsService {
    private NewsDao newsDao = null;

    public NewsServiceImpl(){
        newsDao = new NewsDaoImpl();
    }

    public List<News> getNewsList() {
        return newsDao.getNewsList();
    }

    // 增加新闻信息
    public boolean add(News news) {
        return newsDao.add(news);
    }

    public News getNewsById(int id) {
        // TODO Auto-generated method stub
        return newsDao.getNewsById(id);
    }
    //分页获取新闻信息列表
    public List<News> getPageNewsList(int pageNo,int pageSize){
        return newsDao.getPageNewsList(pageNo, pageSize);
    }
    //获取新闻总数量
    public int getTotalCount(){
        return newsDao.getTotalCount();
    }
    // 删除新闻信息
    public boolean delete(News news){
        return newsDao.delete(news);
    }
}
