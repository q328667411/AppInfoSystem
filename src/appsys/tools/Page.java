package tools;

import java.util.List;

public class Page<T> {
    // 总页数
    private int totalPageCount;
    // 页面大小，即每页显示记录数
    private int pageSize = 5;
    // 记录总数
    private int totalCount;
    // 当前页码
    private int currPageNo=1;
    // 每页新闻集合
    private List<T> newslist;

    public int getTotalPageCount() {
        return totalPageCount;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        if (pageSize > 0) {
            this.pageSize = pageSize;
        }
    }
    public int getTotalCount() {

        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        if (totalCount > 0) {
            this.totalCount = totalCount;
            // 计算总页数		//数据总个数		//每页显示的记录数
            totalPageCount = this.totalCount % pageSize == 0 ? (this.totalCount / pageSize)
                    : (this.totalCount / pageSize + 1);
        }

    }

    public int getCurrPageNo() {

        return currPageNo;
    }

    public void setCurrPageNo(int currPageNo) {
        if (currPageNo > 0) {
            this.currPageNo = currPageNo;

        }else{
            this.currPageNo = 1;
        }

    }

    public List<T> getNewslist() {
        return newslist;
    }

    public void setNewslist(List<T> newslist) {
        this.newslist = newslist;
    }
}
