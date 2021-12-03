package edu.xcdq.servlet;

import edu.xcdq.bean.News;
import edu.xcdq.service.NewsService;
import edu.xcdq.service.impl.NewsServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class AddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        boolean bRet = false;
        boolean bUpload = false;
        String uploadFileName = "";
        String fieldName = "";
        News news = new News();
        news.setCreateDate(new Date());
        //解析请求之前先判断请求类型是否为文件上传类型
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        //指定上传位置
        String uploadFilePath = request.getSession().getServletContext().getRealPath("upload/");
        System.out.println("位置：" + uploadFilePath );
        File saveDir = new File(uploadFilePath);
        //如果目录不存在，就创建目录
        if(!saveDir.exists()){
            saveDir.mkdir();
        }

        if(isMultipart){
            //创建文件上传核心类
            FileItemFactory factory = new DiskFileItemFactory(); // 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
            ServletFileUpload upload = new ServletFileUpload(factory); // 用以上工厂实例化上传组件
            try{
                //处理表单请求
                List<FileItem> items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                while(iter.hasNext()){
                    FileItem item = (FileItem)iter.next();
                    if(item.isFormField()){// 如果是普通表单控件
                        fieldName = item.getFieldName();// 获得该字段名称
                        if(fieldName.equals("title")){
                            news.setTitle(item.getString("UTF-8"));//获得该字段值
                        }else if(fieldName.equals("categoryId")){
                            news.setCategoryId(Integer.parseInt(item.getString()));
                        }else if(fieldName.equals("summary")){
                            news.setSummary(item.getString("UTF-8"));
                        }else if(fieldName.equals("newscontent")){
                            news.setContent(item.getString("UTF-8"));
                        }else if(fieldName.equals("author")){
                            news.setAuthor(item.getString("UTF-8"));
                        }
                    }else{// 如果为文件域
                        String fileName = item.getName();// 获得文件名(全路径)
                        if(fileName != null && !fileName.equals("")){
                            File fullFile = new File(fileName);
                            File saveFile = new File(uploadFilePath,fullFile.getName());//将文件保存到指定的路径
                            System.out.println(uploadFilePath);
                            item.write(saveFile);
                            uploadFileName = fullFile.getName();
                            news.setPicPath(uploadFileName);
                            bUpload = true;

                        }

                    }
                }
            }catch(Exception e){
                e.printStackTrace();
            }

        }
        System.out.println("上传成功之后的文件名：" + news.getPicPath());

        NewsService newsService = new NewsServiceImpl();
        //调用后台的方法，将新闻信息插入数据库中
        bRet = newsService.add(news);
        if(bRet)
            response.sendRedirect("/news/jsp/admin/newsDetailList.jsp");
        else
            response.sendRedirect("/news/jsp/admin/newsDetailCreateSimple.jsp");
    }

}
