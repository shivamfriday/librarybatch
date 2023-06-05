package in.ineuron.model;

public class Books {
	private String bookId;
	private String authorName;
	private String title;
	private String catName;
	private String edition;
	private Integer bookPrice;
	private String description;
	private Integer qty;
	private byte[] frontImage;
	private byte[] backImage;
	
	
	
	
	
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}



	public String getEdition() {
		return edition;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
	public byte[] getFrontImage() {
		return frontImage;
	}
	public void setFrontImage(byte[] frontImage) {
		this.frontImage = frontImage;
	}
	public byte[] getBackImage() {
		return backImage;
	}
	public void setBackImage(byte[] backImage) {
		this.backImage = backImage;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(Integer bookPrice) {
		this.bookPrice = bookPrice;
	}
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	
	
	
	
	
}
