package egovframework.a.model;

/*
 * DTO 클래스는 데이터를 캡슐화하고 클래스 간의 데이터 전달을 쉽게 하기 위해 사용된다.
 * 주로 데이터베이스로부터 읽어온 데이터나 컨트롤러에서 전달받은 데이터를 저장하는 용도로 활용된다.
 * */
 

// userADTO 클래스를 정의한다. 이 클래스는 사용자 정보를 담는 DTO 역할을 한다.
public class userADTO {
	// 사용자의 아이디를 저장하는 멤버 변수이다.
	private String id;	// 사용자ID
	// 사용자의 비밀번호를 저장하는 멤버 변수이다.
	private String password;  // 사용자 패스워드
	// 사용자의 아이디를 반환하는 게터(getter) 메서드이다.
	public String getId() {
		return id;
	}
	// 사용자의 아이디를 설정하는 세터(setter) 메서드이다.
	public void setId(String id) {
		this.id = id;
	}
	// 사용자의 비밀번호를 반환하는 게터 메서드이다.
	public String getPassword() {
		return password;
	}
	// 사용자의 비밀번호를 설정하는 세터 메서드이다.
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
