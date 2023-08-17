package egovframework.d.model;

public class lisq100DTO {
	private String qcCode;			// QC 코드
	private String qcName;			// QC 물질명
	private String lotNo;			// Lot No
	private String qcLevel;			// Level
	private String item1;			// 검사파트
	private String startDate;		// 시작일
	private String endDate;			// 종료일
	private String qcSpecimenSer;	// 고정검체번호
	
	public String getQcCode() {
		return qcCode;
	}
	public void setQcCode(String qcCode) {
		this.qcCode = qcCode;
	}
	public String getQcName() {
		return qcName;
	}
	public void setQcName(String qcName) {
		this.qcName = qcName;
	}
	public String getLotNo() {
		return lotNo;
	}
	public void setLotNo(String lotNo) {
		this.lotNo = lotNo;
	}
	public String getQcLevel() {
		return qcLevel;
	}
	public void setQcLevel(String qcLevel) {
		this.qcLevel = qcLevel;
	}
	public String getItem1() {
		return item1;
	}
	public void setItem1(String item1) {
		this.item1 = item1;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getQcSpecimenSer() {
		return qcSpecimenSer;
	}
	public void setQcSpecimenSer(String qcSpecimenSer) {
		this.qcSpecimenSer = qcSpecimenSer;
	}
}
