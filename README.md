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
mini2 Project 개발 기간<br><br>
총 개발 기간 : 2024.06.28 ~ 2024.07.05<br><br>
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
 ┣ 📂main
 ┃ ┣ 📂java
 ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┣ 📜AdminController.java
 ┃ ┃ ┃ ┣ 📜AnswerController.java
 ┃ ┃ ┃ ┣ 📜BoardController.java
 ┃ ┃ ┃ ┣ 📜CommentController.java
 ┃ ┃ ┃ ┣ 📜DiaryController.java
 ┃ ┃ ┃ ┣ 📜LocationController.java
 ┃ ┃ ┃ ┣ 📜MainController.java
 ┃ ┃ ┃ ┣ 📜MemberController.java
 ┃ ┃ ┃ ┣ 📜NaverNewsController.java
 ┃ ┃ ┃ ┣ 📜PetController.java
 ┃ ┃ ┃ ┣ 📜ReplyController.java
 ┃ ┃ ┃ ┗ 📜StatisticsController.java
 ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┣ 📜AnswerDao.java
 ┃ ┃ ┃ ┣ 📜BoardDao.java
 ┃ ┃ ┃ ┣ 📜BoardImagesDao.java
 ┃ ┃ ┃ ┣ 📜CommentDao.java
 ┃ ┃ ┃ ┣ 📜DiaryDao.java
 ┃ ┃ ┃ ┣ 📜DiaryDaoImpl.java
 ┃ ┃ ┃ ┣ 📜HealthDAO.java
 ┃ ┃ ┃ ┣ 📜LocationDao.java
 ┃ ┃ ┃ ┣ 📜LocationDaoImpl.java
 ┃ ┃ ┃ ┣ 📜MemberDAO.java
 ┃ ┃ ┃ ┣ 📜NewsItemDao.java
 ┃ ┃ ┃ ┣ 📜NewsItemImpl.java
 ┃ ┃ ┃ ┣ 📜PetDAO.java
 ┃ ┃ ┃ ┣ 📜ReplyDao.java
 ┃ ┃ ┃ ┗ 📜StatisticsDAO.java
 ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┣ 📜LocationService.java
 ┃ ┃ ┃ ┗ 📜NaverNewsService.java
 ┃ ┃ ┣ 📂util
 ┃ ┃ ┃ ┣ 📜FileDownload.java
 ┃ ┃ ┃ ┣ 📜MyCommon.java
 ┃ ┃ ┃ ┣ 📜MyOpenAPIKey.java
 ┃ ┃ ┃ ┣ 📜NaverSearchUtills.java
 ┃ ┃ ┃ ┗ 📜Paging.java
 ┃ ┃ ┗ 📂vo
 ┃ ┃ ┃ ┣ 📜AnswerVo.java
 ┃ ┃ ┃ ┣ 📜BoardImagesVo.java
 ┃ ┃ ┃ ┣ 📜BoardVo.java
 ┃ ┃ ┃ ┣ 📜CommentVo.java
 ┃ ┃ ┃ ┣ 📜FeedingVo.java
 ┃ ┃ ┃ ┣ 📜HealthVO.java
 ┃ ┃ ┃ ┣ 📜LocationVo.java
 ┃ ┃ ┃ ┣ 📜MemberVO.java
 ┃ ┃ ┃ ┣ 📜NewsItem.java
 ┃ ┃ ┃ ┣ 📜NoteVo.java
 ┃ ┃ ┃ ┣ 📜PetVO.java
 ┃ ┃ ┃ ┣ 📜ReplyVo.java
 ┃ ┃ ┃ ┣ 📜StatisticsVO.java
 ┃ ┃ ┃ ┣ 📜StollVo.java
 ┃ ┃ ┃ ┗ 📜WeightVo.java
 ┃ ┣ 📂resources
 ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┣ 📂mybatis
 ┃ ┃ ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┃ ┃ ┣ 📜answer.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜comment.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜diary.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜health.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜member.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜newsitem.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜pet.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜reply.xml
 ┃ ┃ ┃ ┃ ┃ ┗ 📜statistics.xml
 ┃ ┃ ┃ ┃ ┣ 📜db.properties
 ┃ ┃ ┃ ┃ ┗ 📜mybatis-config.xml
 ┃ ┃ ┃ ┣ 📂spring
 ┃ ┃ ┃ ┃ ┣ 📂context
 ┃ ┃ ┃ ┃ ┃ ┣ 📜context-0-sample.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜context-1-datasource.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜context-2-mybatis.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜context-3-dao.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜context-4-service.xml
 ┃ ┃ ┃ ┃ ┃ ┗ 📜context-5-fileupload.xml
 ┃ ┃ ┃ ┃ ┗ 📂servlet
 ┃ ┃ ┃ ┃ ┃ ┗ 📜servlet-context.xml
 ┃ ┃ ┃ ┗ 📜.DS_Store
 ┃ ┃ ┗ 📜.DS_Store
 ┃ ┣ 📂webapp
 ┃ ┃ ┣ 📂META-INF
 ┃ ┃ ┃ ┗ 📜MANIFEST.MF
 ┃ ┃ ┣ 📂WEB-INF
 ┃ ┃ ┃ ┣ 📂views
 ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┣ 📜adminMenu.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜boardList.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜healthDetail.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜healthList.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜healthModify.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜memberListForPets.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜memberPetList.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜memberRegister.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜petModify.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜replyList.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜topForAdmin.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜topMenu.jsp
 ┃ ┃ ┃ ┃ ┣ 📂answer
 ┃ ┃ ┃ ┃ ┃ ┗ 📜answer_list.jsp
 ┃ ┃ ┃ ┃ ┣ 📂board
 ┃ ┃ ┃ ┃ ┃ ┣ 📜NewFile.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board_answer.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board_answer_modify_form.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board_ex.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board_insert_form.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board_list.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board_list_free.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board_list_medical.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board_modify_form.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board_reply_form.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜board_view.jsp
 ┃ ┃ ┃ ┃ ┣ 📂diary
 ┃ ┃ ┃ ┃ ┃ ┣ 📜_diary_main.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜diary_insert_form__.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜diary_list.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜diary_modify_form.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜diary_view.jsp
 ┃ ┃ ┃ ┃ ┣ 📂location
 ┃ ┃ ┃ ┃ ┃ ┣ 📜location_main.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜testview2.jsp
 ┃ ┃ ┃ ┃ ┣ 📂member
 ┃ ┃ ┃ ┃ ┃ ┣ 📜memberDetail.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜memberList.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜memberModify.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜member_insert_form.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜member_login_form.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜myPage.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜myPageModify.jsp
 ┃ ┃ ┃ ┃ ┣ 📂news
 ┃ ┃ ┃ ┃ ┃ ┣ 📜news_main.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜testview.jsp
 ┃ ┃ ┃ ┃ ┣ 📂pet
 ┃ ┃ ┃ ┃ ┃ ┣ 📜petList.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜petModify.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜petRegister.jsp
 ┃ ┃ ┃ ┃ ┣ 📂reply
 ┃ ┃ ┃ ┃ ┃ ┗ 📜reply_list.jsp
 ┃ ┃ ┃ ┃ ┣ 📂statistics
 ┃ ┃ ┃ ┃ ┃ ┗ 📜statistics.jsp
 ┃ ┃ ┃ ┃ ┣ 📜footer.jsp
 ┃ ┃ ┃ ┃ ┣ 📜main.jsp
 ┃ ┃ ┃ ┃ ┣ 📜navbar.jsp
 ┃ ┃ ┃ ┃ ┗ 📜top.jsp
 ┃ ┃ ┃ ┗ 📜web.xml
 ┃ ┃ ┣ 📂resources
 ┃ ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┃ ┗ 📜common.css
 ┃ ┃ ┃ ┣ 📂images
 ┃ ┃ ┃ ┃ ┣ 📂diary
 ┃ ┃ ┃ ┃ ┃ ┣ 📜diary_1.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜diary_2.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜diary_3.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜diary_4.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜diary_5.png
 ┃ ┃ ┃ ┃ ┣ 📂main
 ┃ ┃ ┃ ┃ ┃ ┣ 📜main_0.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜main_1.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜main_2.png
 ┃ ┃ ┃ ┃ ┣ 📂pets
 ┃ ┃ ┃ ┃ ┃ ┗ 📜default.png
 ┃ ┃ ┃ ┃ ┣ 📜board_img.jpg
 ┃ ┃ ┃ ┃ ┣ 📜comment_img.jpg
 ┃ ┃ ┃ ┃ ┣ 📜logo.png
 ┃ ┃ ┃ ┃ ┣ 📜member_img.jpg
 ┃ ┃ ┃ ┃ ┣ 📜pet_img.jpg
 ┃ ┃ ┃ ┃ ┗ 📜statistics_img.jpg
 ┃ ┃ ┃ ┣ 📜.DS_Store
 ┃ ┃ ┃ ┗ 📜index.global.js
 ┃ ┃ ┣ 📜.DS_Store
 ┃ ┃ ┗ 📜index.jsp
 ┃ ┗ 📜.DS_Store
 ┣ 📂test
 ┃ ┣ 📂java
 ┃ ┗ 📂resources
 ┗ 📜.DS_Store
</details>
```
