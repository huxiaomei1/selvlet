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

    // ����������Ϣ
    public boolean add(News news) {
        return newsDao.add(news);
    }

    public News getNewsById(int id) {
        // TODO Auto-generated method stub
        return newsDao.getNewsById(id);
    }
    //��ҳ��ȡ������Ϣ�б�
    public List<News> getPageNewsList(int pageNo,int pageSize){
        return newsDao.getPageNewsList(pageNo, pageSize);
    }
    //��ȡ����������
    public int getTotalCount(){
        return newsDao.getTotalCount();
    }
    // ɾ��������Ϣ
    public boolean delete(News news){
        return newsDao.delete(news);
    }
}
