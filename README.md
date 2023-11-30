# LIS : 전문 진단검사의학과 정보시스템

### 역할
- QC결과조회(일별) - 송유근

- QC검사항목관리 - 이우열

- 기준정보설정 - 박수린

- 시약코드설정 - 이호승

- 문서등록 - 최지수
<br /><br />

### 기준정보설정 구현 화면
![lislogin](https://github.com/Parksoorin/WeatherApp/assets/101718825/2c8bab25-7241-412b-a9e2-da72a1f2df3a)
>로그인 <br />
<br />

![lisjoin](https://github.com/Parksoorin/WeatherApp/assets/101718825/ff1dd078-f272-48f5-80c2-219ef6d59f62)
>회원가입 <br />
<br />

![lis1](https://github.com/Parksoorin/WeatherApp/assets/101718825/97920d40-0352-484d-ab2d-4dcc9642e053)
>로그인 시 <br />
<br />

![lisAll2](https://github.com/Parksoorin/WeatherApp/assets/101718825/00994970-4b9a-4b69-8420-132ed295b791)
>모든 Grid에 데이터 불러올 때 <br />
>: 각 Grid의 입력, 삭제, 수정(컬럼설정)은 flag값의 설정으로 이루어진다.
>flag가 'I'이면 입력을, 'D'이면 삭제를, 'U'이면 업데이트를 하게 설정되어 있다. 
<br />

![lisGrid1](https://github.com/Parksoorin/WeatherApp/assets/101718825/6a7be9c3-2afa-4871-b147-a0137c300b54)
>Grid1(table1) <br />
>: Grid2의 컬럼설정(table1의 item1)과 Grid3의 컬럼설정(table1의 item2)을 위한 데이터가 hidden으로 설정되어 있다. <br />
> : 텍스트박스를 통해 원하는 데이터의 검색이 가능하다. 
<br />

![lisGrid2](https://github.com/Parksoorin/WeatherApp/assets/101718825/3513570f-c93b-4f22-b267-deb6dc1990a4)
>Grid2(table2) <br />
>: Grid1의 행 클릭시 table2를 Grid2에 불러온다.
<br />

![lisGrid3](https://github.com/Parksoorin/WeatherApp/assets/101718825/e1670a97-240b-4e44-b084-94184a84bce8)
>Grid3(table3) <br />
>: Grid2의 행 클릭시 table3을 Grid3에 불러온다.
<br />

![그리드1컬럼](https://github.com/Parksoorin/WeatherApp/assets/101718825/f24e61bf-1550-467b-a252-248707ad1c69)
>Grid2 컬럼설정 <br />
>: Grid1에서 클릭된 행의 item1 값을 가져온다. 
<br />

![그리드2컬럼](https://github.com/Parksoorin/WeatherApp/assets/101718825/8234057d-3543-41a7-8b2d-5f38dcaeb952)
>Grid3 컬럼설정 <br />
>: Grid1에서 클릭된 행과 Grid2에서 클릭된 행을 join하여 item2 값을 가져온다. 
<br />

![그리드2컬럼2](https://github.com/Parksoorin/WeatherApp/assets/101718825/a3eb5841-e390-4e5c-85f2-dae97c56a071)
>컬럼설정 상세 이미지 <br />
> : item1과 item2의 형식은 "처방코드;처방명칭;Default;조회순번;전달파트;파트접수여부;;"와 같이 되어 있다. 이것을 세미콜론을 기준으로 나누어 텍스트 박스에 차례로 들어가게 한다. 그리고 텍스트박스에 값이 들어있을 경우, 해당 Grid에 컬럼이 표현되게 한다. <br />
> : 컬럼설정에서 컬럼을 변경 후 저장 시 table1의 item1과 item2도 변경된다. 
<br />
