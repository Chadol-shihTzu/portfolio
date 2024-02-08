package com.portfolio.jdh.domain;

public class Page {
	// ���� ������ ��ȣ
	private int num;

	// �Խù� �� ����
	private int count;
	private int count2;

	public int getCount2() {
		return count2;
	}
	public void setCount2(int count2) {
		this.count2 = count2;
		dataCalc2();
	}

	// �� �������� ����� �Խù� ����
	private int postNum = 10;
	private int postNum2 = 9;

	public int getPostNum2() {
		return postNum2;
	}
	public void setPostNum2(int postNum2) {
		this.postNum2 = postNum2;
	}

	// �ϴ� ����¡ ��ȣ ([ �Խù� �� ���� �� �� �������� ����� ���� ]�� �ø�)
	private int pageNum;

	// ����� �Խù�
	private int displayPost;

	// �ѹ��� ǥ���� ����¡ ��ȣ�� ����
	private int pageNumCnt = 10;

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		dataCalc();
	}
	private void dataCalc() {
		 
		 // ������ ��ȣ
		 endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		 
		 // ���� ��ȣ
		 startPageNum = endPageNum - (pageNumCnt - 1);
		 
		 // ������ ��ȣ ����
		 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
		 
		 if(endPageNum > endPageNum_tmp) {
		  endPageNum = endPageNum_tmp;
		 }
		 
		 prev = startPageNum == 1 ? false : true;
		 next = endPageNum * pageNumCnt >= count ? false : true;
		 
		 displayPost = (num - 1) * postNum;
		 
		}
	private void dataCalc2() {
		 
		 // ������ ��ȣ
		 endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		 
		 // ���� ��ȣ
		 startPageNum = endPageNum - (pageNumCnt - 1);
		 
		 // ������ ��ȣ ����
		 int endPageNum_tmp = (int)(Math.ceil((double)count2 / (double)pageNumCnt));
		 
		 if(endPageNum > endPageNum_tmp) {
		  endPageNum = endPageNum_tmp;
		 }
		 
		 prev = startPageNum == 1 ? false : true;
		 next = endPageNum * pageNumCnt >= count2 ? false : true;
		 
		 displayPost = (num - 1) * postNum2;
		 
		}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getDisplayPost() {
		return displayPost;
	}
	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}
	public int getPageNumCnt() {
		return pageNumCnt;
	}
	public void setPageNumCnt(int pageNumCnt) {
		this.pageNumCnt = pageNumCnt;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	
	public boolean getPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean getNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}

	// ǥ�õǴ� ������ ��ȣ �� ������ ��ȣ
	private int endPageNum;

	// ǥ�õǴ� ������ ��ȣ �� ù��° ��ȣ
	private int startPageNum;

	// ����/���� ǥ�� ����
	private boolean prev;
	private boolean next;
	
	//�˻� Ÿ�԰� �˻���
	/*
	private String searchTypeKeyword;
	
	public void setSearchTypeKeyword(String searchType, String keyword) {
		if(searchType.equals("") || keyword.equals("")) {
			searchTypeKeyword = "";
		}else {
			searchTypeKeyword = "%searchType="+searchType+"$keyword="+keyword;
		}
	}
	
	public String getSearchTypeKeyword() {
		return searchTypeKeyword;
	}
	*/
	
	
	
	private String searchType;
	private String keyword;

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	/*
	private String searchTypeKeyword; 

	public void setSearchTypeKeyword(String searchType, String keyword) {
	 
	 if(searchType.equals("") || keyword.equals("")) {
	  searchTypeKeyword = ""; 
	 } else {
	  searchTypeKeyword = "&searchType=" + searchType + "&keyword=" + keyword; 
	 }  
	}
	*/
	public String getSearchTypeKeyword() {
		 
		 if(searchType.equals("") || keyword.equals("")) {
		  return ""; 
		 } else {
		  return "&amp;searchType=" + searchType + "&amp;keyword=" + keyword; 
		 }
		}


	
}
