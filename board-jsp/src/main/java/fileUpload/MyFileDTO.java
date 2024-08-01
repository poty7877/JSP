package fileUpload;

public class MyFileDTO {
	private String idx;		 // index번호
	private String name;	 // 이름
	private String title;	 // 제목
	private String cate;	 // 카테고리
	private String ofile;	 // 원래 파일명
	private String sfile;	 // 저장용 파일명
	private String postdate; // 게시날짜

	public MyFileDTO() {

	} // 기본 생성자

	// method getter-setter
	public String getIdx() {
		return idx;
	}

	public String getName() {
		return name;
	}

	public String getTitle() {
		return title;
	}

	public String getCate() {
		return cate;
	}

	public String getOfile() {
		return ofile;
	}

	public String getSfile() {
		return sfile;
	}

	public String getPostdate() {
		return postdate;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public void setOfile(String ofile) {
		this.ofile = ofile;
	}

	public void setSfile(String sfile) {
		this.sfile = sfile;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

}
