package kr.co.vo;

public class SearchCriteria extends Criteria{

	private String searchType = "";
	private String keyword = "";
	private String searchEType = "";
	private String eTypeKeyword = "";
	 
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
	public String getSearchEType() {
		return searchEType;
	}
	public void setSearchEType(String searchEType) {
		this.searchEType = searchEType;
	}
	public String geteTypeKeyword() {
		return eTypeKeyword;
	}
	public void seteTypeKeyword(String eTypeKeyword) {
		this.eTypeKeyword = eTypeKeyword;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword 
						+ ", searchEType=" + searchEType + ", eTypeKeyword=" + eTypeKeyword + "]";
	}
	
}