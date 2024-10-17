# mini1

![logo](https://github.com/user-attachments/assets/a7861377-a95a-4db5-a132-d978e57624c5)
<br>
<br>
<br>
<br>
## 프로젝트 설명
배달의 민족과 요기요를 벤치마킹한 웹 기반의 배달 주문 딜리버리 서비스입니다. <br>
자바, 스프링 기반의 웹 형식으로 개발하였습니다.  <br>
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
![jQuery](https://img.shields.io/badge/jQuery-0769AD?logo=jquery&logoColor=white)
![AJAX](https://img.shields.io/badge/AJAX-4B8BBE?logo=javascript&logoColor=white)
![JSON](https://img.shields.io/badge/JSON-000000?logo=json&logoColor=white)

### 백앤드

![Java](https://img.shields.io/badge/Java-17-007396?logo=java&logoColor=white)
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?&logo=spring&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-9.0-F80000?logo=oracle&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-3.8.6-C71A36?logo=apachemaven&logoColor=white)
![MyBatis](https://img.shields.io/badge/MyBatis-000000?logo=mybatis&logoColor=white)
![KakaoMap API](https://img.shields.io/badge/KakaoMap%20API-FFCD00?logo=kakao&logoColor=black)

### 협업 툴

![Notion](https://img.shields.io/badge/Notion-000000?logo=notion&logoColor=white)
![Slack](https://img.shields.io/badge/Slack-4A154B?logo=slack&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white)
![Jira](https://img.shields.io/badge/Jira-0052CC?logo=jira&logoColor=white)
![Confluence](https://img.shields.io/badge/Confluence-172B4D?logo=confluence&logoColor=white)


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
파이널 프로젝트 주제 : 반려견 종합 정보 시스템 <br><br>
주제 선정 이유 : 반려견을 키우는 입장에서 반려견이 입장 가능한 곳, 반려견을 위한 곳, 그런 부분에 대한 정보를  <br><br>
<br>
<br>
mini2 Project 개발 기간<br><br>
총 개발 기간 : 2024.07.25 ~ 2024.08.02<br><br>
특이사항 : Oracle 9.0 버전을 사용한 이유는 이미지 업로드를 위한 File 함수가 Javax 기반이기 때문에 <br><br>
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

## 클라우드 ERD (권한 필요)

![miniproject2_ERD](https://github.com/user-attachments/assets/1c382119-6726-4fa4-86e0-719ebe35ba74)
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
git clone https://github.com/tkcheon/GlobalIT_Final.git

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
