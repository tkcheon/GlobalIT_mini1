insert into post values(seq_post_p_idx.nextval,'소파','화이트톤에 따뜻한 감성 더하기, 셀프 인테리어 시작','안녕하세요. 저는 7살, 9살 아이들을 키우고 있는 홍길동입니다.
사실 저희 집은 인테리어 공사를 한 집이 아니기 때문에 집들이 발행하시는 다른 집에 비해서 너무나도 평범한 집이지만, 한 집에 오래 살다 보니 집을 좀 변화시키고 싶은 마음에 최근 들어 소소하게 소품으로 집을 하나 둘 꾸며보게 되었습니다.
저희는 거실 확장했습니다. 저희 집의 특이점이 있다면 방 하나를 확장했다는 점입니다.어차피 아이들이 주로 생활하는 공간이 거실이기 때문에 남편과 저는 같은 생각으로 방 하나를 확장하자 하여 과감하게 거실 확장 옵션을 선택하였습니다.
저희 집 거실입니다. 위에서 말씀드렸다시피 우물천장 조명 말고는 거실은 특별히 인테리어 시공을 하지 않은 집이라 아무래도 전체적으로 밝은 분위기의 집으로 만들고 싶어서  "소품으로라도 밝게 만들어보자!"라는 생각으로 화이트톤의 소품으로 하나 둘 꾸며가기 시작했습니다.
저희 집은 서향 집이라 낮부터 해가 들어오기 시작하면서 오후에 햇살이 잘 드는 햇살 맛집입니다.','1.png',default,default,1,1,1)


select * from comments_list_view where p_idx = 22

select * from post

create user test1 identified by test1

-- 회원 테이블
create table member(
	m_idx	int not null,					-- 회원번호
	m_name	varchar2(50) not null unique,	-- 회원명
	m_id	varchar2(50) not null,			-- 아이디
	m_pw	varchar2(50) not null,			-- 비밀번호
	m_email	varchar2(50) not null unique,	-- 이메일
	m_intro	varchar2(100) default '안녕하세요',	-- 자기소개 
	m_rdate	date default sysdate,			-- 등록일자
	m_mdate	date default sysdate,			-- 수정일자
	m_type	int default 1 					-- 구분(일반:1, 관리자:2)
);

-- Primary Key
alter table member add constraint pk_member_m_idx primary key(m_idx);

-- check
alter table member add constraint ck_member_m_type check (m_type in (1,2)); 

-- Sequence 지정
create sequence seq_member_m_idx; 

-- 더미데이터 혹은 관리자 계정 설정 (비밀번호 암호화 적용 때문에 아래처럼 말고 직접 회원가입하기) 
-- insert into member(m_name, m_id, m_pw, m_email, m_type) values ('테스트계정', 'test', 'test', 'test@test.com', 1);
-- SELECT * FROM member WHERE m_id = 'admin' AND m_pw = 'admin';

-- 테스트
select * from member
-- delete from member where m_id = 'admin'

update member set m_type = 2 where m_id='admin'

-- 제약조건까지 삭제 (필요시)
drop table member  CASCADE CONSTRAINTS

-- 시퀀스 삭제 (필요시)
drop sequence seq_member_m_idx;


-- 이렇게 하면 안됨. 비밀번호가 암호화 안되서 
insert into member values(seq_member_m_idx.nextVal,'관리자','admin','admin','admin@naver.com',default,default,default,2);
insert into member values(seq_member_m_idx.nextVal,'홍길동','hong','1234','hong@naver.com',default,default,default,default);
insert into member values(seq_member_m_idx.nextVal,'일길동','one','1111','one@naver.com',default,default,default,default);
insert into member values(seq_member_m_idx.nextVal,'김하나','rlagksk','rlagksk','rlagksk@naver.com',default,default,default,default);
insert into member values(seq_member_m_idx.nextVal,'이지원','dlwldnjs','dlwldnjs','dlwldnjs@naver.com',default,default,default,default);
insert into member values(seq_member_m_idx.nextVal,'황예림','ghkdPdla','ghkdPdla','ghkdPdla@naver.com',default,default,default,default);



-- ============================================================

-- 게시글 테이블
create table post(
	p_idx		int not null,			-- 게시번호
	p_cate		varchar2(50) not null,	-- 카테고리
	p_title		varchar2(100) not null, -- 게시글제목
	p_content 	varchar2(2000) not null,-- 내용
	p_filename	varchar2(2000) not null,-- 이미지 
	p_rdate		date default sysdate,	-- 등록일자
	p_mdate 	date default sysdate,	-- 수정일자
	p_type 		int default 1,			-- 구분(일반:1, 관리자:2)
	p_hit 		int default 1,			-- 조회수
	m_idx 		int not null			-- 회원번호
);

-- Primary Key
alter table post add constraint pk_post_p_idx primary key(p_idx);

-- Foreign Key
alter table post add constraint fk_post_m_idx foreign key (m_idx) references member(m_idx) on delete cascade;

-- check
alter table post add constraint ck_post_p_type check (p_type in (1,2));

-- Sequence 지정
create sequence seq_post_p_idx;


--- 게시글 더미데이터 


insert into post values(seq_post_p_idx.nextval,'소파','화이트톤에 따뜻한 감성 더하기, 셀프 인테리어 시작','안녕하세요. 저는 7살, 9살 아이들을 키우고 있는 홍길동입니다.
사실 저희 집은 인테리어 공사를 한 집이 아니기 때문에 집들이 발행하시는 다른 집에 비해서 너무나도 평범한 집이지만, 한 집에 오래 살다 보니 집을 좀 변화시키고 싶은 마음에 최근 들어 소소하게 소품으로 집을 하나 둘 꾸며보게 되었습니다.
저희는 거실 확장했습니다. 저희 집의 특이점이 있다면 방 하나를 확장했다는 점입니다.어차피 아이들이 주로 생활하는 공간이 거실이기 때문에 남편과 저는 같은 생각으로 방 하나를 확장하자 하여 과감하게 거실 확장 옵션을 선택하였습니다.
저희 집 거실입니다. 위에서 말씀드렸다시피 우물천장 조명 말고는 거실은 특별히 인테리어 시공을 하지 않은 집이라 아무래도 전체적으로 밝은 분위기의 집으로 만들고 싶어서  "소품으로라도 밝게 만들어보자!"라는 생각으로 화이트톤의 소품으로 하나 둘 꾸며가기 시작했습니다.
저희 집은 서향 집이라 낮부터 해가 들어오기 시작하면서 오후에 햇살이 잘 드는 햇살 맛집입니다.','1.png',default,default,1,1,1)

insert into post values(seq_post_p_idx.nextval,'침대','안녕하세요','안녕하세요. 1.5평의 작은방에 사는 변덕스러운 일길동입니다. 저는 3년 전 첫 번째 집들이 속 공간에서 옆방으로 이사(?)를 했는데요. 다시 시작된 저의 1.5평 작은방의 소소한 변화들을 두 번째 집들이를 통해 소개할 수 있게 되어 무척 설레네요. 그럼, 함께 보실까요?
기존 방은 외풍이 심해서 늘 겨울에 고생을 심하게 했었거든요. 그리고 방을 옮기면서 집 일부에 창문, 도배, 장판, 페인팅의 부분 인테리어도 진행하게 되었어요.
도배와 장판을 마친 후의 모습이에요. 깔끔한 기본 화이트로 도배했어요.','2.png',default,default,1,1,2);

insert into post values(seq_post_p_idx.nextval,'소파','반려동물을 위한 집으로 변신!','안녕하세요,admin입니다. 
결혼 7년 차에 신혼희망타운을 분양받았고, 분양 당시 저희에게 라이프 스타일에 맞는 인테리어를 하기 위해 [마이너스 옵션]을 선택하게 되었어요!아파트가 완공이 되어갈 즈음 "루아"가 새 가족이 되었고, 루아와 함께 사는 집을 만들기 위해 기획 단계에서부터 반려견 맞춤형으로 인테리어를 기획 설계하게 되었습니다. 반려견과 함께 사는 집인 만큼 루아만을 위한 포인트 공간들을 더욱 집중적으로 소개해 드릴게요!
20평대 거실이라 톤이나 가구에 따라 좁아 보일 수 있는데, 아이보리톤과 우드 톤으로 따듯하면서도 평수 대비 더 넓어 보이도록 디자인했습니다.','3,png',default,default,1,1,3);

insert into post values(seq_post_p_idx.nextval,'침대','나만의 위한 공간으로 인테리어하기','안녕하세요 :) 패션 브랜드에서 기획 MD로 일하고 있는 20대 직장인 ghdrlfehd입니다.
타고난 감각이 없어 오늘의집에서 하나하나 공부하며 꾸며온 집을 소개할 기회가 생겨 굉장히 설레는 아침이에요. 모쪼록 피곤한 아침이 이렇게 개운한 걸 보니 최근의 저에겐 이만한 환기가 없었던 것 같습니다. 
집은 나를 나타내는 가장 건강한 취미인 것 같아요. 자연과 모던함을 담아보려 노력했던 이 집에서 여러분이 잠시나마 쉬시며 저와 비슷한 감정을 느끼신다면, 그것보다 위인 게 없겠습니다.
집의 부족한 채광은 다양한 형태와 색감의 조명을 구매하여 채워 나갔어요!햇빛이 없는 집에 식물을 키울 수 없으니 최대한 자연이 담긴 패브릭과 액자, 블랭킷을 구매하여 자연의 느낌을 내보았어요.','4.png',default,default,1,1,1);

insert into post values(seq_post_p_idx.nextval,'의자','우드톤의 부드러운 분위기로 홈스타일링하기','안녕하세요. 3번째의 저희 집은 저랑 남편 그리고 귀여운 반려동물 식빵이가 함께 살고 있는 주거공간이랍니다.
사실 동네에 매물만 구경하려고 부동산에 방문했는데요. 남향만 고집하던 저희에게 부동산 소장님께서 동향이지만 꼭 보여 주고 싶은 집이 있다며 소개해 주셨던 집이에요. 들어가자마자 환한 느낌이라 홀린 듯 계약을 하게 되었습니다.
이 아파트는 거의 20년이 된 구축 아파트이어서 원하는 인테리어를 다하면 비용이 초과될 듯한 느낌이기에  홈스타일링으로 집을 꾸며 보고자 최대한 도화지 같은 집으로 리모델링을 진행했어요. 좁은 거실 공간을 넓어 보이기 위해 전체적인 톤을 화이트로 맞추고 우드 가구나 소품으로 포인트를 주어 부드러운 분위기를 형상시켰어요.','5.png',default,default,1,1,4);

insert into post values(seq_post_p_idx.nextval,'식탁','네 식구의 주방 맞아요! 복잡함 No, 미니멀 유지하기','안녕하세요. 결혼 10년 차인 두 남매 엄마인 ssuki입니다. 아직 홈스타일링이 미완성 상태라 온라인 집들이 작성에 고민이 들기도 했지만, 지금 우리 집만으로도 만족 중이라 하나하나 글을 써 보려고 합니다!
2년 기다림 끝에 분양받은 저희 가족의 보금자리 신축 아파트지만 인테리어에 관심도 많았고 집 꾸미기를 좋아했던 저라 올 리모델링을 계획했는데 워킹맘이라 업체도 발품 팔 시간도 나지 않아 올 리모델링은 하지 못했어요.
하지만, 아파트 옵션과 부분 인테리어로 나만의 홈스타일링을 완성했답니다. 주방은 엔지니어드 스톤으로 벽과 아일랜드 옵션을 넣었고요. 더 넓은 싱크볼을 사용하고 싶어서 사각 싱크볼로 교체했어요.앞뒤로 넓게 다 사용할 수 있는 일자형 구조라 참 좋아요. 한번 할 음식 두 번 하게 되는 거 같은 마법 같은 주방이 되었답니다.','6.png',default,default,1,1,5);


insert into post values(seq_post_p_idx.nextval,'침대','화이트톤에 따뜻한 감성 더하기, 셀프 인테리어 시작','안녕하세요. 저는 7살, 9살 아이들을 키우고 있는 아이엄마입니다.
사실 저희 집은 인테리어 공사를 한 집이 아니기 때문에 집들이 발행하시는 다른 집에 비해서 너무나도 평범한 집이지만, 한 집에 오래 살다 보니 집을 좀 변화시키고 싶은 마음에 최근 들어 소소하게 소품으로 집을 하나 둘 꾸며보게 되었습니다.
저희는 거실 확장했습니다. 저희 집의 특이점이 있다면 방 하나를 확장했다는 점입니다.어차피 아이들이 주로 생활하는 공간이 거실이기 때문에 남편과 저는 같은 생각으로 방 하나를 확장하자 하여 과감하게 거실 확장 옵션을 선택하였습니다.
저희 집 거실입니다. 위에서 말씀드렸다시피 우물천장 조명 말고는 침실은 특별히 인테리어 시공을 하지 않은 집이라 아무래도 전체적으로 밝은 분위기의 집으로 만들고 싶어서  "소품으로라도 밝게 만들어보자!"라는 생각으로 화이트톤의 소품으로 하나 둘 꾸며가기 시작했습니다.
저희 집은 서향 집이라 낮부터 해가 들어오기 시작하면서 오후에 햇살이 잘 드는 햇살 맛집입니다.','7.png',default,default,1,1,6);

insert into post values(seq_post_p_idx.nextval,'소파','안녕하세요','안녕하세요. 1.5평의 작은방에 사는 변덕스러운 dkflek입니다. 저는 3년 전 첫 번째 집들이 속 공간에서 옆방으로 이사(?)를 했는데요. 다시 시작된 저의 1.5평 작은방의 소소한 변화들을 두 번째 집들이를 통해 소개할 수 있게 되어 무척 설레네요. 그럼, 함께 보실까요?
기존 방은 외풍이 심해서 늘 겨울에 고생을 심하게 했었거든요. 그리고 방을 옮기면서 집 일부에 창문, 도배, 장판, 페인팅의 부분 인테리어도 진행하게 되었어요.
도배와 장판을 마친 후의 모습이에요. 깔끔한 기본 화이트로 도배했어요.','8.png',default,default,1,1,4);

insert into post values(seq_post_p_idx.nextval,'식탁','반려동물을 위한 집으로 변신!','안녕하세요,admin입니다. 
결혼 7년 차에 신혼희망타운을 분양받았고, 분양 당시 저희에게 라이프 스타일에 맞는 인테리어를 하기 위해 [마이너스 옵션]을 선택하게 되었어요!아파트가 완공이 되어갈 즈음 "루아"가 새 가족이 되었고, 루아와 함께 사는 집을 만들기 위해 기획 단계에서부터 반려견 맞춤형으로 인테리어를 기획 설계하게 되었습니다. 반려견과 함께 사는 집인 만큼 루아만을 위한 포인트 공간들을 더욱 집중적으로 소개해 드릴게요!
20평대 거실이라 톤이나 가구에 따라 좁아 보일 수 있는데, 아이보리톤과 우드 톤으로 따듯하면서도 평수 대비 더 넓어 보이도록 디자인했습니다.','9.png',default,default,1,1,5);

insert into post values(seq_post_p_idx.nextval,'수납장','나만의 위한 공간으로 인테리어하기','안녕하세요 :) 패션 브랜드에서 기획 MD로 일하고 있는 20대 직장인입니다.
타고난 감각이 없어 오늘의집에서 하나하나 공부하며 꾸며온 집을 소개할 기회가 생겨 굉장히 설레는 아침이에요. 모쪼록 피곤한 아침이 이렇게 개운한 걸 보니 최근의 저에겐 이만한 환기가 없었던 것 같습니다. 
집은 나를 나타내는 가장 건강한 취미인 것 같아요. 자연과 모던함을 담아보려 노력했던 이 집에서 여러분이 잠시나마 쉬시며 저와 비슷한 감정을 느끼신다면, 그것보다 위인 게 없겠습니다.
집의 부족한 채광은 다양한 형태와 색감의 조명을 구매하여 채워 나갔어요!햇빛이 없는 집에 식물을 키울 수 없으니 최대한 자연이 담긴 패브릭과 액자, 블랭킷을 구매하여 자연의 느낌을 내보았어요.','10.png',default,default,1,1,2);

insert into post values(seq_post_p_idx.nextval,'소파','우드톤의 부드러운 분위기로 홈스타일링하기','안녕하세요. 3번째의 저희 집은 저랑 남편 그리고 귀여운 반려동물 식빵이가 함께 살고 있는 주거공간이랍니다.
사실 동네에 매물만 구경하려고 부동산에 방문했는데요. 남향만 고집하던 저희에게 부동산 소장님께서 동향이지만 꼭 보여 주고 싶은 집이 있다며 소개해 주셨던 집이에요. 들어가자마자 환한 느낌이라 홀린 듯 계약을 하게 되었습니다.
이 아파트는 거의 20년이 된 구축 아파트이어서 원하는 인테리어를 다하면 비용이 초과될 듯한 느낌이기에  홈스타일링으로 집을 꾸며 보고자 최대한 도화지 같은 집으로 리모델링을 진행했어요. 좁은 거실 공간을 넓어 보이기 위해 전체적인 톤을 화이트로 맞추고 우드 가구나 소품으로 포인트를 주어 부드러운 분위기를 형상시켰어요.','11.png',default,default,1,1,3);

insert into post values(seq_post_p_idx.nextval,'의자','네 식구의 주방 맞아요! 복잡함 No, 미니멀 유지하기','안녕하세요. 결혼 10년 차인 두 남매 엄마인 ssuki입니다. 아직 홈스타일링이 미완성 상태라 온라인 집들이 작성에 고민이 들기도 했지만, 지금 우리 집만으로도 만족 중이라 하나하나 글을 써 보려고 합니다!
2년 기다림 끝에 분양받은 저희 가족의 보금자리 신축 아파트지만 인테리어에 관심도 많았고 집 꾸미기를 좋아했던 저라 올 리모델링을 계획했는데 워킹맘이라 업체도 발품 팔 시간도 나지 않아 올 리모델링은 하지 못했어요.
하지만, 아파트 옵션과 부분 인테리어로 나만의 홈스타일링을 완성했답니다. 주방은 엔지니어드 스톤으로 벽과 아일랜드 옵션을 넣었고요. 더 넓은 싱크볼을 사용하고 싶어서 사각 싱크볼로 교체했어요.앞뒤로 넓게 다 사용할 수 있는 일자형 구조라 참 좋아요. 한번 할 음식 두 번 하게 되는 거 같은 마법 같은 주방이 되었답니다.','12.png',default,default,1,1,1);


insert into post values(seq_post_p_idx.nextval,'수납장','화이트톤에 따뜻한 감성 더하기, 셀프 인테리어 시작','안녕하세요. 저는 7살, 9살 아이들을 키우고 있는 아이엄마입니다.
사실 저희 집은 인테리어 공사를 한 집이 아니기 때문에 집들이 발행하시는 다른 집에 비해서 너무나도 평범한 집이지만, 한 집에 오래 살다 보니 집을 좀 변화시키고 싶은 마음에 최근 들어 소소하게 소품으로 집을 하나 둘 꾸며보게 되었습니다.
저희는 거실 확장했습니다. 저희 집의 특이점이 있다면 방 하나를 확장했다는 점입니다.어차피 아이들이 주로 생활하는 공간이 거실이기 때문에 남편과 저는 같은 생각으로 방 하나를 확장하자 하여 과감하게 거실 확장 옵션을 선택하였습니다.
저희 집 거실입니다. 위에서 말씀드렸다시피 우물천장 조명 말고는 침실은 특별히 인테리어 시공을 하지 않은 집이라 아무래도 전체적으로 밝은 분위기의 집으로 만들고 싶어서  "소품으로라도 밝게 만들어보자!"라는 생각으로 화이트톤의 소품으로 하나 둘 꾸며가기 시작했습니다.
저희 집은 서향 집이라 낮부터 해가 들어오기 시작하면서 오후에 햇살이 잘 드는 햇살 맛집입니다.','13.png',default,default,1,1,6);

insert into post values(seq_post_p_idx.nextval,'의자','안녕하세요','안녕하세요. 1.5평의 작은방에 사는 변덕스러운 어른입니다. 저는 3년 전 첫 번째 집들이 속 공간에서 옆방으로 이사(?)를 했는데요. 다시 시작된 저의 1.5평 작은방의 소소한 변화들을 두 번째 집들이를 통해 소개할 수 있게 되어 무척 설레네요. 그럼, 함께 보실까요?
기존 방은 외풍이 심해서 늘 겨울에 고생을 심하게 했었거든요. 그리고 방을 옮기면서 집 일부에 창문, 도배, 장판, 페인팅의 부분 인테리어도 진행하게 되었어요.
도배와 장판을 마친 후의 모습이에요. 깔끔한 기본 화이트로 도배했어요.','14.png',default,default,1,1,2);

insert into post values(seq_post_p_idx.nextval,'수납장','반려동물을 위한 집으로 변신!','안녕하세요,admin입니다. 
결혼 7년 차에 신혼희망타운을 분양받았고, 분양 당시 저희에게 라이프 스타일에 맞는 인테리어를 하기 위해 [마이너스 옵션]을 선택하게 되었어요!아파트가 완공이 되어갈 즈음 "루아"가 새 가족이 되었고, 루아와 함께 사는 집을 만들기 위해 기획 단계에서부터 반려견 맞춤형으로 인테리어를 기획 설계하게 되었습니다. 반려견과 함께 사는 집인 만큼 루아만을 위한 포인트 공간들을 더욱 집중적으로 소개해 드릴게요!
20평대 거실이라 톤이나 가구에 따라 좁아 보일 수 있는데, 아이보리톤과 우드 톤으로 따듯하면서도 평수 대비 더 넓어 보이도록 디자인했습니다.','15.png',default,default,1,1,5);

insert into post values(seq_post_p_idx.nextval,'수납장','나만의 위한 공간으로 인테리어하기','안녕하세요 :) 패션 브랜드에서 기획 MD로 일하고 있는 20대 직장인입니다.
타고난 감각이 없어 오늘의집에서 하나하나 공부하며 꾸며온 집을 소개할 기회가 생겨 굉장히 설레는 아침이에요. 모쪼록 피곤한 아침이 이렇게 개운한 걸 보니 최근의 저에겐 이만한 환기가 없었던 것 같습니다. 
집은 나를 나타내는 가장 건강한 취미인 것 같아요. 자연과 모던함을 담아보려 노력했던 이 집에서 여러분이 잠시나마 쉬시며 저와 비슷한 감정을 느끼신다면, 그것보다 위인 게 없겠습니다.
집의 부족한 채광은 다양한 형태와 색감의 조명을 구매하여 채워 나갔어요!햇빛이 없는 집에 식물을 키울 수 없으니 최대한 자연이 담긴 패브릭과 액자, 블랭킷을 구매하여 자연의 느낌을 내보았어요.','16.png',default,default,1,1,4);

insert into post values(seq_post_p_idx.nextval,'수납장','우드톤의 부드러운 분위기로 홈스타일링하기','안녕하세요. 3번째의 저희 집은 저랑 남편 그리고 귀여운 반려동물 식빵이가 함께 살고 있는 주거공간이랍니다.
사실 동네에 매물만 구경하려고 부동산에 방문했는데요. 남향만 고집하던 저희에게 부동산 소장님께서 동향이지만 꼭 보여 주고 싶은 집이 있다며 소개해 주셨던 집이에요. 들어가자마자 환한 느낌이라 홀린 듯 계약을 하게 되었습니다.
이 아파트는 거의 20년이 된 구축 아파트이어서 원하는 인테리어를 다하면 비용이 초과될 듯한 느낌이기에  홈스타일링으로 집을 꾸며 보고자 최대한 도화지 같은 집으로 리모델링을 진행했어요. 좁은 거실 공간을 넓어 보이기 위해 전체적인 톤을 화이트로 맞추고 우드 가구나 소품으로 포인트를 주어 부드러운 분위기를 형상시켰어요.','17.png',default,default,1,1,6);

insert into post values(seq_post_p_idx.nextval,'식탁','네 식구의 주방 맞아요! 복잡함 No, 미니멀 유지하기','안녕하세요. 결혼 10년 차인 두 남매 엄마인 ssuki입니다. 아직 홈스타일링이 미완성 상태라 온라인 집들이 작성에 고민이 들기도 했지만, 지금 우리 집만으로도 만족 중이라 하나하나 글을 써 보려고 합니다!
2년 기다림 끝에 분양받은 저희 가족의 보금자리 신축 아파트지만 인테리어에 관심도 많았고 집 꾸미기를 좋아했던 저라 올 리모델링을 계획했는데 워킹맘이라 업체도 발품 팔 시간도 나지 않아 올 리모델링은 하지 못했어요.
하지만, 아파트 옵션과 부분 인테리어로 나만의 홈스타일링을 완성했답니다. 주방은 엔지니어드 스톤으로 벽과 아일랜드 옵션을 넣었고요. 더 넓은 싱크볼을 사용하고 싶어서 사각 싱크볼로 교체했어요.앞뒤로 넓게 다 사용할 수 있는 일자형 구조라 참 좋아요. 한번 할 음식 두 번 하게 되는 거 같은 마법 같은 주방이 되었답니다.','18.png',default,default,1,1,3);


insert into post values(seq_post_p_idx.nextval,'식탁','화이트톤에 따뜻한 감성 더하기, 셀프 인테리어 시작','안녕하세요. 저는 7살, 9살 아이들을 키우고 있는 아이엄마입니다.
사실 저희 집은 인테리어 공사를 한 집이 아니기 때문에 집들이 발행하시는 다른 집에 비해서 너무나도 평범한 집이지만, 한 집에 오래 살다 보니 집을 좀 변화시키고 싶은 마음에 최근 들어 소소하게 소품으로 집을 하나 둘 꾸며보게 되었습니다.
저희는 거실 확장했습니다. 저희 집의 특이점이 있다면 방 하나를 확장했다는 점입니다.어차피 아이들이 주로 생활하는 공간이 거실이기 때문에 남편과 저는 같은 생각으로 방 하나를 확장하자 하여 과감하게 거실 확장 옵션을 선택하였습니다.
저희 집 거실입니다. 위에서 말씀드렸다시피 우물천장 조명 말고는 침실은 특별히 인테리어 시공을 하지 않은 집이라 아무래도 전체적으로 밝은 분위기의 집으로 만들고 싶어서  "소품으로라도 밝게 만들어보자!"라는 생각으로 화이트톤의 소품으로 하나 둘 꾸며가기 시작했습니다.
저희 집은 서향 집이라 낮부터 해가 들어오기 시작하면서 오후에 햇살이 잘 드는 햇살 맛집입니다.','19.png',default,default,1,1,1);

insert into post values(seq_post_p_idx.nextval,'식탁','안녕하세요','안녕하세요. 1.5평의 작은방에 사는 변덕스러운 어른입니다. 저는 3년 전 첫 번째 집들이 속 공간에서 옆방으로 이사(?)를 했는데요. 다시 시작된 저의 1.5평 작은방의 소소한 변화들을 두 번째 집들이를 통해 소개할 수 있게 되어 무척 설레네요. 그럼, 함께 보실까요?
기존 방은 외풍이 심해서 늘 겨울에 고생을 심하게 했었거든요. 그리고 방을 옮기면서 집 일부에 창문, 도배, 장판, 페인팅의 부분 인테리어도 진행하게 되었어요.
도배와 장판을 마친 후의 모습이에요. 깔끔한 기본 화이트로 도배했어요.','20.png',default,default,1,1,2);

insert into post values(seq_post_p_idx.nextval,'침대','반려동물을 위한 집으로 변신!','안녕하세요,admin입니다. 
결혼 7년 차에 신혼희망타운을 분양받았고, 분양 당시 저희에게 라이프 스타일에 맞는 인테리어를 하기 위해 [마이너스 옵션]을 선택하게 되었어요!아파트가 완공이 되어갈 즈음 "루아"가 새 가족이 되었고, 루아와 함께 사는 집을 만들기 위해 기획 단계에서부터 반려견 맞춤형으로 인테리어를 기획 설계하게 되었습니다. 반려견과 함께 사는 집인 만큼 루아만을 위한 포인트 공간들을 더욱 집중적으로 소개해 드릴게요!
20평대 거실이라 톤이나 가구에 따라 좁아 보일 수 있는데, 아이보리톤과 우드 톤으로 따듯하면서도 평수 대비 더 넓어 보이도록 디자인했습니다.','21.png',default,default,1,1,3);

insert into post values(seq_post_p_idx.nextval,'의자','나만의 위한 공간으로 인테리어하기','안녕하세요 :) 패션 브랜드에서 기획 MD로 일하고 있는 20대 직장인입니다.
타고난 감각이 없어 오늘의집에서 하나하나 공부하며 꾸며온 집을 소개할 기회가 생겨 굉장히 설레는 아침이에요. 모쪼록 피곤한 아침이 이렇게 개운한 걸 보니 최근의 저에겐 이만한 환기가 없었던 것 같습니다. 
집은 나를 나타내는 가장 건강한 취미인 것 같아요. 자연과 모던함을 담아보려 노력했던 이 집에서 여러분이 잠시나마 쉬시며 저와 비슷한 감정을 느끼신다면, 그것보다 위인 게 없겠습니다.
집의 부족한 채광은 다양한 형태와 색감의 조명을 구매하여 채워 나갔어요!햇빛이 없는 집에 식물을 키울 수 없으니 최대한 자연이 담긴 패브릭과 액자, 블랭킷을 구매하여 자연의 느낌을 내보았어요.','22.png',default,default,1,1,4);

insert into post values(seq_post_p_idx.nextval,'수납장','우드톤의 부드러운 분위기로 홈스타일링하기','안녕하세요. 3번째의 저희 집은 저랑 남편 그리고 귀여운 반려동물 식빵이가 함께 살고 있는 주거공간이랍니다.
사실 동네에 매물만 구경하려고 부동산에 방문했는데요. 남향만 고집하던 저희에게 부동산 소장님께서 동향이지만 꼭 보여 주고 싶은 집이 있다며 소개해 주셨던 집이에요. 들어가자마자 환한 느낌이라 홀린 듯 계약을 하게 되었습니다.
이 아파트는 거의 20년이 된 구축 아파트이어서 원하는 인테리어를 다하면 비용이 초과될 듯한 느낌이기에  홈스타일링으로 집을 꾸며 보고자 최대한 도화지 같은 집으로 리모델링을 진행했어요. 좁은 거실 공간을 넓어 보이기 위해 전체적인 톤을 화이트로 맞추고 우드 가구나 소품으로 포인트를 주어 부드러운 분위기를 형상시켰어요.','23.png',default,default,1,1,5);

insert into post values(seq_post_p_idx.nextval,'소파','거실 맞아요! 복잡함 No, 미니멀 유지하기','안녕하세요. 결혼 10년 차인 두 남매 엄마인 ssuki입니다. 아직 홈스타일링이 미완성 상태라 온라인 집들이 작성에 고민이 들기도 했지만, 지금 우리 집만으로도 만족 중이라 하나하나 글을 써 보려고 합니다!
2년 기다림 끝에 분양받은 저희 가족의 보금자리 신축 아파트지만 인테리어에 관심도 많았고 집 꾸미기를 좋아했던 저라 올 리모델링을 계획했는데 워킹맘이라 업체도 발품 팔 시간도 나지 않아 올 리모델링은 하지 못했어요.
하지만, 아파트 옵션과 부분 인테리어로 나만의 홈스타일링을 완성했답니다. 주방은 엔지니어드 스톤으로 벽과 아일랜드 옵션을 넣었고요. 더 넓은 싱크볼을 사용하고 싶어서 사각 싱크볼로 교체했어요.앞뒤로 넓게 다 사용할 수 있는 일자형 구조라 참 좋아요. 한번 할 음식 두 번 하게 되는 거 같은 마법 같은 주방이 되었답니다.','24.png',default,default,1,1,6);


insert into post values(seq_post_p_idx.nextval,'소파','화이트톤에 따뜻한 감성 더하기, 셀프 인테리어 시작','안녕하세요. 저는 7살, 9살 아이들을 키우고 있는 아이엄마입니다.
사실 저희 집은 인테리어 공사를 한 집이 아니기 때문에 집들이 발행하시는 다른 집에 비해서 너무나도 평범한 집이지만, 한 집에 오래 살다 보니 집을 좀 변화시키고 싶은 마음에 최근 들어 소소하게 소품으로 집을 하나 둘 꾸며보게 되었습니다.
저희는 거실 확장했습니다. 저희 집의 특이점이 있다면 방 하나를 확장했다는 점입니다.어차피 아이들이 주로 생활하는 공간이 거실이기 때문에 남편과 저는 같은 생각으로 방 하나를 확장하자 하여 과감하게 거실 확장 옵션을 선택하였습니다.
저희 집 거실입니다. 위에서 말씀드렸다시피 우물천장 조명 말고는 침실은 특별히 인테리어 시공을 하지 않은 집이라 아무래도 전체적으로 밝은 분위기의 집으로 만들고 싶어서  "소품으로라도 밝게 만들어보자!"라는 생각으로 화이트톤의 소품으로 하나 둘 꾸며가기 시작했습니다.
저희 집은 서향 집이라 낮부터 해가 들어오기 시작하면서 오후에 햇살이 잘 드는 햇살 맛집입니다.','25.png',default,default,1,1,1);

insert into post values(seq_post_p_idx.nextval,'의자','안녕하세요','안녕하세요. 1.5평의 작은방에 사는 변덕스러운입니다. 저는 3년 전 첫 번째 집들이 속 공간에서 옆방으로 이사(?)를 했는데요. 다시 시작된 저의 1.5평 작은방의 소소한 변화들을 두 번째 집들이를 통해 소개할 수 있게 되어 무척 설레네요. 그럼, 함께 보실까요?
기존 방은 외풍이 심해서 늘 겨울에 고생을 심하게 했었거든요. 그리고 방을 옮기면서 집 일부에 창문, 도배, 장판, 페인팅의 부분 인테리어도 진행하게 되었어요.
도배와 장판을 마친 후의 모습이에요. 깔끔한 기본 화이트로 도배했어요.','26.png',default,default,1,1,2);

insert into post values(seq_post_p_idx.nextval,'침대','반려동물을 위한 집으로 변신!','안녕하세요,admin입니다. 
결혼 7년 차에 신혼희망타운을 분양받았고, 분양 당시 저희에게 라이프 스타일에 맞는 인테리어를 하기 위해 [마이너스 옵션]을 선택하게 되었어요!아파트가 완공이 되어갈 즈음 "루아"가 새 가족이 되었고, 루아와 함께 사는 집을 만들기 위해 기획 단계에서부터 반려견 맞춤형으로 인테리어를 기획 설계하게 되었습니다. 반려견과 함께 사는 집인 만큼 루아만을 위한 포인트 공간들을 더욱 집중적으로 소개해 드릴게요!
20평대 거실이라 톤이나 가구에 따라 좁아 보일 수 있는데, 아이보리톤과 우드 톤으로 따듯하면서도 평수 대비 더 넓어 보이도록 디자인했습니다.','27.png',default,default,1,1,3);

insert into post values(seq_post_p_idx.nextval,'식탁','나만의 위한 공간으로 인테리어하기','안녕하세요 :) 패션 브랜드에서 기획 MD로 일하고 있는 20대 직장인입니다.
타고난 감각이 없어 오늘의집에서 하나하나 공부하며 꾸며온 집을 소개할 기회가 생겨 굉장히 설레는 아침이에요. 모쪼록 피곤한 아침이 이렇게 개운한 걸 보니 최근의 저에겐 이만한 환기가 없었던 것 같습니다. 
집은 나를 나타내는 가장 건강한 취미인 것 같아요. 자연과 모던함을 담아보려 노력했던 이 집에서 여러분이 잠시나마 쉬시며 저와 비슷한 감정을 느끼신다면, 그것보다 위인 게 없겠습니다.
집의 부족한 채광은 다양한 형태와 색감의 조명을 구매하여 채워 나갔어요!햇빛이 없는 집에 식물을 키울 수 없으니 최대한 자연이 담긴 패브릭과 액자, 블랭킷을 구매하여 자연의 느낌을 내보았어요.','28.png',default,default,1,1,4);

insert into post values(seq_post_p_idx.nextval,'의자','우드톤의 부드러운 분위기로 홈스타일링하기','안녕하세요. 3번째의 저희 집은 저랑 남편 그리고 귀여운 반려동물 식빵이가 함께 살고 있는 주거공간이랍니다.
사실 동네에 매물만 구경하려고 부동산에 방문했는데요. 남향만 고집하던 저희에게 부동산 소장님께서 동향이지만 꼭 보여 주고 싶은 집이 있다며 소개해 주셨던 집이에요. 들어가자마자 환한 느낌이라 홀린 듯 계약을 하게 되었습니다.
이 아파트는 거의 20년이 된 구축 아파트이어서 원하는 인테리어를 다하면 비용이 초과될 듯한 느낌이기에  홈스타일링으로 집을 꾸며 보고자 최대한 도화지 같은 집으로 리모델링을 진행했어요. 좁은 거실 공간을 넓어 보이기 위해 전체적인 톤을 화이트로 맞추고 우드 가구나 소품으로 포인트를 주어 부드러운 분위기를 형상시켰어요.','29.png',default,default,1,1,5);

insert into post values(seq_post_p_idx.nextval,'침대','침실 맞아요! 복잡함 No, 미니멀 유지하기','안녕하세요. 결혼 10년 차인 두 남매 엄마인 ssuki입니다. 아직 홈스타일링이 미완성 상태라 온라인 집들이 작성에 고민이 들기도 했지만, 지금 우리 집만으로도 만족 중이라 하나하나 글을 써 보려고 합니다!
2년 기다림 끝에 분양받은 저희 가족의 보금자리 신축 아파트지만 인테리어에 관심도 많았고 집 꾸미기를 좋아했던 저라 올 리모델링을 계획했는데 워킹맘이라 업체도 발품 팔 시간도 나지 않아 올 리모델링은 하지 못했어요.
하지만, 아파트 옵션과 부분 인테리어로 나만의 홈스타일링을 완성했답니다. 주방은 엔지니어드 스톤으로 벽과 아일랜드 옵션을 넣었고요. 더 넓은 싱크볼을 사용하고 싶어서 사각 싱크볼로 교체했어요.앞뒤로 넓게 다 사용할 수 있는 일자형 구조라 참 좋아요. 한번 할 음식 두 번 하게 되는 거 같은 마법 같은 주방이 되었답니다.','30.png',default,default,1,1,6);









-- 테스트
select * from post

-- 제약조건까지 삭제 (필요시)
drop table post  CASCADE CONSTRAINTS

-- 시퀀스 삭제  (필요시)
drop sequence seq_post_p_idx;

-- ============================================================

-- 게시글 좋아요/스크랩 테이블
create table post_like(
	l_idx 	int not null,			-- 좋아요/스크랩 번호
	l_rdate date default sysdate,	-- 생성일
	l_mdate date default sysdate,	-- 수정일
	l_type 	int not null,			-- 구분(좋아요:1, 스크랩:2)
	m_idx 	int not null,			-- 회원번호
	p_idx 	int	not null			-- 게시글 번호
)

-- Primary Key
alter table post_like add constraint pk_post_like_p_idx primary key(l_idx);

-- Foreign Key
alter table post_like add constraint fk_post_like_m_idx foreign key (m_idx) references member(m_idx) on delete cascade;
alter table post_like add constraint fk_post_like_p_idx foreign key (p_idx) references post(p_idx) on delete cascade;

-- check 
alter table post_like add constraint ck_post_like_l_type check (l_type in (1,2));

-- 좋아요 중복 방지
alter table post_like add constraint unique_post_like unique (p_idx, l_idx);

-- Sequence 지정
create sequence seq_post_like_l_idx;

-- 제약조건까지 삭제 (필요시)
drop table post_like  CASCADE CONSTRAINTS

-- 시퀀스 삭제  (필요시)
drop sequence seq_post_like_l_idx;

select * from post_like

-- ================================================================
-- 댓글 테이블
create table comments(
	c_idx		int not null,			-- 댓글번호
	c_content	varchar2(1000) not null,-- 내용
	c_rdate		date default sysdate,	-- 등록일자
	c_mdate		date default sysdate,	-- 수정일자
	p_idx		int not null,			-- 게시판번호
	m_idx		int not null			-- 회원번호
);
-- Primary Key
alter table comments add constraint pk_comments_c_idx primary key(c_idx);
-- Foreign Key
alter table comments add constraint fk_comments_m_idx foreign key (m_idx) references member(m_idx) on delete cascade;
alter table comments add constraint fk_comments_p_idx foreign key (p_idx) references post(p_idx) on delete cascade;
-- Sequence 지정
create sequence seq_comments_c_idx;

-- 테스트 
insert into comments(c_idx, c_content, p_idx, m_idx) values (seq_comments_c_idx.nextval,'테스트',1,1);

-- 제약조건까지 삭제 (필요시)
drop table comments  CASCADE CONSTRAINTS

-- 시퀀스 삭제  (필요시)
drop sequence seq_comments_c_idx;

select * from comments


-- 더미데이터
insert into comments values(seq_comments_c_idx.nextVal,'너무너무 예뻐요!!',default,default,3,3);
insert into comments values(seq_comments_c_idx.nextVal,'자리 배치한게 이쁘고 너무 깔끔하네요!',default,default,3,6);


-- 07/03 추가 - 한지혜
-- comments_list_view 생성 
create or replace view comments_list_view
as
	SELECT  c.c_IDX, c.P_IDX, c.c_CONTENT, c.c_RDATE, c.c_MDATE, c.M_IDX, m.m_name   
	from comments c, member m
	where c.m_idx = m.m_idx
	
select * from comments_list_view



-- 06/25 추가 - 한지혜
-- post_view 생성 
-- 회원 id를 기준으로 회원 이름 포함한 컬럼을 가져온다. 
-- post 테이블에 회원 이름 컬럼명이 없어서 post와 member 테이블 조인
  
create or replace view post_list_view
as
	SELECT  p.P_IDX, p.P_CATE, p.P_TITLE, p.P_CONTENT,p.p_filename, p.P_RDATE, p.P_MDATE, p.P_TYPE, p.P_HIT, p.M_IDX, m.m_name, m.m_type   
	from post p, member m
	where p.m_idx = m.m_idx

	
	
select * from post_list_view

-- 작성일 기준 내림차순 (최신순) 
select * from post_list_view order by p_rdate desc