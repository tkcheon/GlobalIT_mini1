# SweetHome
![logo](https://github.com/user-attachments/assets/25c676f7-87f4-4552-b533-866922319fff)
<br>
<br>
<br>
<br>
## 프로젝트 설명
오늘의 집을 벤치마킹하여 개발한 이미지 형식의 블로그 웹 서비스입니다. <br>
Servlet, JSP 기반으로 개발하였습니다.  <br>
<br>
<br>
<br>
## 기술스택

### 프론트앤드

![HTML](https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white)
![CSS](https://img.shields.io/badge/CSS3-1572B6?logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)
![JSP](https://img.shields.io/badge/JSP-007396?logo=java&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?logo=bootstrap&logoColor=white)

### 백앤드

![Java](https://img.shields.io/badge/Java-17-007396?logo=java&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-10.0-F80000?logo=oracle&logoColor=white)


### 협업 툴

![Slack](https://img.shields.io/badge/Slack-4A154B?logo=slack&logoColor=white)


### 기타
![ERDCloud](https://img.shields.io/badge/ERDCloud-00C7B7?logoColor=white)

<br>
<br>
<br>
<br>

## 개발 정보
global IT(글로벌 아이티)<br>
교육 과정 : 풀스택 프레임워크(자바,스프링)기반 데이터 융합SW개발자 과정 (7회차) 1조 <br>
교육 기간 : 2024.04.04 ~ 2024.10.07<br>
<br>
파이널 프로젝트 주제 : 이미지 블로그 웹 게시판  <br><br>
주제 선정 이유 : 사람들은 이미지가 올려져있는 글을 더 선호하고 정보를 얻는 데 더 믿음성이 있기 때문에  <br><br>
<br>
<br>
mini1 Project 개발 기간<br><br>
총 개발 기간 : 2024.06.28 ~ 2024.07.05<br><br>
프로젝트 내 역할 : 메인화면&마이페이지 UI, 게시판 CRUD, 회원가입 UI , 로그인페이지 기능 수정<br><br>
회고 : 개발자 옵션을 통해 프론트엔드 UI를 쉽게 만들 수 있다고 생각했는데 크나큰 오산이였고 프로젝트 개발할 때 왜 에자일하게 하는 지 느낄 수 있었다. 또한, 코드를 차분히 분석해야되는 걸 깨닫는 계기가 되었다. 


<br>
<br>
<br>

## 팀원 소개

|팀장| 팀원 1     | 팀원 2      | 팀원 3      | 팀원 4      |
|-----------------|------------------|------------------|------------------|------------------|
| ![송은호](https://avatars.githubusercontent.com/u/171783646?s=400&v=4) | ![천태광](https://avatars.githubusercontent.com/u/100704194?v=4) | ![한지혜](https://avatars.githubusercontent.com/u/155419924?v=4) | ![김수만](https://avatars.githubusercontent.com/u/172689170?v=4) | ![손유정](https://avatars.githubusercontent.com/u/172688739?v=4) |
| [송은호](https://github.com/SongEH)   | [천태광](https://github.com/tkcheon)     | [한지혜](https://github.com/jhh1245)     | [김수만](https://github.com/SoomanKim02)     | [손유정](https://github.com/suj5020)     |
<br>
<br>
<br>
<br>

## WinERD 
<img width="865" alt="스크린샷 2024-10-18 오전 12 01 00" src="https://github.com/user-attachments/assets/e87591af-cb3b-41dc-b9bc-cd7d6da0114e">

<br>
<br>
<br>
<br>

## 사용 방법
1. 파일을 다운 받는다.<br>
2. Eclips로 실행.<br>
<br>
<br>
<br>

### 설치 및 업로드 

```bash
1. 파일을 다운받을 디렉토리로 이동 

2. 해당 github clone
git clone https://github.com/tkcheon/GlobalIT_mini1.git

3. vscode 실행
4. git init
5. git branch -M main
6. git commit -m "project_upload"
7. git push 

```

## 패키지 구조

<details>
  <summary>프로젝트 패키지 구조 보기</summary>

  ```text
📦src
 ┣ 📂DB
 ┃ ┗ 📜BlogDB.sql
 ┣ 📂main
 ┃ ┣ 📂java
 ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┣ 📜CommentDao.java
 ┃ ┃ ┃ ┣ 📜MemberDao.java
 ┃ ┃ ┃ ┗ 📜PostDao.java
 ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┗ 📜DBService.java
 ┃ ┃ ┣ 📂servlet
 ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┣ 📜AdminMemberDeleteAction.java
 ┃ ┃ ┃ ┃ ┣ 📜AdminMemberList.java
 ┃ ┃ ┃ ┃ ┣ 📜AdminMemberModifyAction.java
 ┃ ┃ ┃ ┃ ┗ 📜AdminMemberModifyFormAction.java
 ┃ ┃ ┃ ┣ 📂comment
 ┃ ┃ ┃ ┃ ┣ 📜CommentDeleteAction.java
 ┃ ┃ ┃ ┃ ┣ 📜CommentInsertAction.java
 ┃ ┃ ┃ ┃ ┗ 📜CommentListAction.java
 ┃ ┃ ┃ ┣ 📂member
 ┃ ┃ ┃ ┃ ┣ 📜ChangePasswordAction.java
 ┃ ┃ ┃ ┃ ┣ 📜FindPasswordAction.java
 ┃ ┃ ┃ ┃ ┣ 📜LoginAction.java
 ┃ ┃ ┃ ┃ ┣ 📜LogoutAction.java
 ┃ ┃ ┃ ┃ ┣ 📜MemberCheckEmailAction.java
 ┃ ┃ ┃ ┃ ┣ 📜MemberCheckIdAction.java
 ┃ ┃ ┃ ┃ ┣ 📜MemberCheckNameAction.java
 ┃ ┃ ┃ ┃ ┣ 📜MemberDeleteAction.java
 ┃ ┃ ┃ ┃ ┣ 📜MemberJoinAction.java
 ┃ ┃ ┃ ┃ ┣ 📜MemberModifyAction.java
 ┃ ┃ ┃ ┃ ┣ 📜MemberModifyFormAction.java
 ┃ ┃ ┃ ┃ ┗ 📜MemberMypageAction.java
 ┃ ┃ ┃ ┣ 📂post
 ┃ ┃ ┃ ┃ ┣ 📜PostDeleteAction.java
 ┃ ┃ ┃ ┃ ┣ 📜PostInsertAction.java
 ┃ ┃ ┃ ┃ ┣ 📜PostInsertFormAction.java
 ┃ ┃ ┃ ┃ ┣ 📜PostLikeAction.java
 ┃ ┃ ┃ ┃ ┣ 📜PostListAction.java
 ┃ ┃ ┃ ┃ ┣ 📜PostModifyAction.java
 ┃ ┃ ┃ ┃ ┣ 📜PostModifyFormAction.java
 ┃ ┃ ┃ ┃ ┣ 📜PostOneAction.java
 ┃ ┃ ┃ ┃ ┗ 📜PostScrapAction.java
 ┃ ┃ ┃ ┗ 📜MainAction.java
 ┃ ┃ ┣ 📂util
 ┃ ┃ ┃ ┣ 📜FileUploadUtils.java
 ┃ ┃ ┃ ┗ 📜Util.java
 ┃ ┃ ┗ 📂vo
 ┃ ┃ ┃ ┣ 📜CommentVo.java
 ┃ ┃ ┃ ┣ 📜MemberVo.java
 ┃ ┃ ┃ ┣ 📜PostVo.java
 ┃ ┃ ┃ ┗ 📜Post_LikeVo.java
 ┃ ┣ 📂webapp
 ┃ ┃ ┣ 📂JSP
 ┃ ┃ ┃ ┗ 📂mypage
 ┃ ┃ ┃ ┃ ┣ 📜member_modify_form.jsp
 ┃ ┃ ┃ ┃ ┗ 📜mypage.jsp
 ┃ ┃ ┣ 📂META-INF
 ┃ ┃ ┃ ┗ 📜MANIFEST.MF
 ┃ ┃ ┣ 📂WEB-INF
 ┃ ┃ ┃ ┗ 📂lib
 ┃ ┃ ┃ ┃ ┣ 📜commons-collections-3.2.1.jar
 ┃ ┃ ┃ ┃ ┣ 📜commons-dbcp-1.2.2.jar
 ┃ ┃ ┃ ┃ ┣ 📜commons-pool-1.4.jar
 ┃ ┃ ┃ ┃ ┣ 📜jakarta.activation-api-2.1.3.jar
 ┃ ┃ ┃ ┃ ┣ 📜jakarta.mail-2.0.1.jar
 ┃ ┃ ┃ ┃ ┗ 📜ojdbc14.jar
 ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┣ 📜admin_member_list.jsp
 ┃ ┃ ┃ ┗ 📜admin_member_modify_form.jsp
 ┃ ┃ ┣ 📂comments
 ┃ ┃ ┃ ┣ 📜comment_modify_form.jsp
 ┃ ┃ ┃ ┗ 📜comments_list.jsp
 ┃ ┃ ┣ 📂logoimage
 ┃ ┃ ┃ ┗ 📜logo.png
 ┃ ┃ ┣ 📂post
 ┃ ┃ ┃ ┣ 📜post_comment_list.jsp
 ┃ ┃ ┃ ┣ 📜post_list.jsp
 ┃ ┃ ┃ ┗ 📜post_modify_form.jsp
 ┃ ┃ ┣ 📂uploads
 ┃ ┃ ┃ ┣ 📜1.png
 ┃ ┃ ┃ ┣ 📜2.png
 ┃ ┃ ┃ ┗ 📜3.png
 ┃ ┃ ┣ 📜.DS_Store
 ┃ ┃ ┣ 📜board_insert_form.jsp
 ┃ ┃ ┣ 📜board_modify_form.jsp
 ┃ ┃ ┣ 📜common.css
 ┃ ┃ ┣ 📜findpwd.jsp
 ┃ ┃ ┣ 📜footer.jsp
 ┃ ┃ ┣ 📜index.html
 ┃ ┃ ┣ 📜joinmember.jsp
 ┃ ┃ ┣ 📜login.jsp
 ┃ ┃ ┣ 📜main-page.jsp
 ┃ ┃ ┣ 📜navbar.jsp
 ┃ ┃ ┣ 📜post_one.jsp
 ┃ ┃ ┗ 📜top.jsp
 ┃ ┗ 📜.DS_Store
 ┗ 📜.DS_Store
```
</details>

## 발표자료
<iframe src="https://1drv.ms/p/c/0c7d9b79476a227c/IQSKV3advujxQ5adHmg-oPpYAc2_KmZCmV5UKuSWEnFccWA" width="402" height="327" frameborder="0" scrolling="no"></iframe>
