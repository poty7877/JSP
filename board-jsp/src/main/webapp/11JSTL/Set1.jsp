<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl의 core 태그 사용 *중요 -->
<!-- Core : 변수 선언, 조건문, 반복문, url처리용으로 활용 -->

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- jstl의 formatting 태그 사용 -->
<!-- Formattion : 숫자, 날짜, 시간 포맷 지정용으로 활용(다국어) -->

<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!-- jstl의 xml 태그 사용 -->
<!-- Xml : 확장자가 xml인 데이터 파싱 -->

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jstl의 function 태그 사용 -->
<!-- Function : 컬렉션, 문자열 처리 -> el에서 사용할 수 있는 메서드 제공 -->

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- jstl의 sql 태그 사용 -->
<!-- Sql : 데이터 베이스 연결, 쿼리 실행 -> JDBC api를 사용하기 때문에 활용성이 없다 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set1.jsp : JSTL 테스트</title>
</head>
<body>
	<!-- 변수 선언 -->
	<c:set var="directVar" value="100" />
	<c:set var="elVar" value=" ${ directVar mod 5 }" />
	<%-- 		${100 나누기 5의 나머지 }EL표기법  --%>
	<c:set var="expVar" value="<%=new Date()%>" />
	<!-- 		 jsp 표현식과 내장된 객체 출력  -->
	<c:set var="betweenVar">변수값 이렇게도 설정 가능</c:set>
	<!-- 		태그 사이의 글자가 값이 됨  -->

	<!-- 변수 출력 -->
	<h4>EL을 이용한 출력 테스트</h4>
	<ul>
		<li>directVar : ${ pageScope.directVar }</li>
		<li>elVar : ${ elVar }</li>
		<li>expVar : ${ expVar }</li>
		<li>betweenVar : ${ betweenVar }</li>
	</ul>
	<!-- 객체 처리 테스트 : 생성 -->
	<hr>
	<h4>자바 빈즈 생성 - 생성자(Person)</h4>
	<c:set var="personVar1" value='<%=new Person("엠비씨", 12)%>'
		scope="request" />
	<!-- 	Person personVar1 = new Person("엠비씨", 12) -->
	<!-- 	request.setAttribute("personVar1", presonVar1) -->
	<h5>자바 빈즈 출력</h5>
	<ul>
		<li>이름 : ${ requestScope.personVar1.name }</li>
		<li>나이 : ${ personVar1.age }</li>
	</ul>
	<hr>
	<h4>자바 빈즈 생성 - target, property 사용 "큰 따옴표"</h4>
	<c:set var="personVar2" value="<%=new Person()%>" scope="request" />
	<c:set target="${ personVar2 }" property="name" value="김기원" />
	<c:set target="${ personVar2 }" property="age" value="36" />

	<h5>자바 빈즈 target 출력</h5>
	<ul>
		<li>이름 : ${ personVar2.name }</li>
		<li>나이 : ${ requestScope.personVar2.age }</li>
	</ul>
	<hr>
	<h4>컬렉션(List)을 사용해 생성</h4>
	<%
	ArrayList<Person> pList = new ArrayList<Person>();
	pList.add(new Person("함시은", 24)); //[0]
	pList.add(new Person("이영훈", 31)); //[1]
	// 	List에 객체2개를 생성하고 연결
	%>

	<c:set var="personList" value="<%=pList%>" scope="request" />
	<c:forEach var="list" items="${ personList }" >
		<ul>
			<li>이름 : ${ list.name }</li>
			<li>나이 : ${ list.age }</li>
		</ul>
		<hr>
	</c:forEach>
	<ul>
		<li>이름 : ${ requestScope.personList[0].name }</li>
		<li>나이 : ${ personList[0].age }</li>
		<li>이름 : ${ personList[1].name }</li>
		<li>나이 : ${ requestScope.personList[1].age }</li>
	</ul>
	<hr>
	
	
	<h4>컬렉션(Map)을 사용해 생성</h4>
	<%
	Map<String, Person> pMaps = new HashMap<String, Person>();
	pMaps.put("person1", new Person("함시은", 24));
	pMaps.put("person2", new Person("이영훈", 31));
	// key = person1, person2 // value = new Person("xxx", yy);
	%>
	<c:set var="personMap" value="<%=pMaps%>" scope="request" />
	<ul>
		<li>이름 : ${ requestScope.personMap.person1.name  }</li>
		<li>나이 : ${ personMap.person1.age }</li>
		<li>이름 : ${ personMap.person2.name }</li>
		<li>나이 : ${ requestScope.personMap.person2.age }</li>
	</ul>
	<hr>
	<h4>삭제 테스트</h4>
	<c:remove var="personVar2" scope="request" />
	<h5>자바 빈즈 target 삭제 후 출력</h5>
	<ul>
		<li>이름 : ${ personVar2.name }</li>
		<li>나이 : ${ requestScope.personVar2.age }</li>
	</ul>














</body>
</html>