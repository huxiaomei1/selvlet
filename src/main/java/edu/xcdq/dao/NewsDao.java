package edu.xcdq.dao;
import java.util.List;
import edu.xcdq.bean.News;
import edu.xcdq.bean.NewsCategory;

public interface NewsDao {

	// ��ѯ������Ϣ
	public List<News> getNewsList();

	// ����������Ϣ
	public boolean add(News news) ;
	// �޸����ű���
	public void update(News news);
	// ɾ��������Ϣ
	public boolean delete(News news);

	// �����ض������������Ϣ
	public void getNewsByTitle(News news);
	
	//��ȡĳ���������������
	public int getCountByCategory(NewsCategory category);
	
	//��������ID�õ�������Ϣ
	public News getNewsById(int id);
	
	//��ȡ����������
	public int getTotalCount();
	
	//��ҳ��ȡ������Ϣ
	public List<News> getPageNewsList(int pageNo, int pageSize);
}
