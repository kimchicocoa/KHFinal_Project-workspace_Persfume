-- 테이블 삭제 영역
DROP TABLE PRODUCT_IMG;
DROP TABLE PRODUCT_REVIEW;
DROP TABLE CART;
DROP TABLE ORDER_PRODUCT;
DROP TABLE ORDER_DETAIL;
DROP TABLE FAVORITES;
DROP TABLE MEM_COUPON;
DROP TABLE COUPON;
DROP TABLE EVENT_IMG;
DROP TABLE EVENT;
DROP TABLE NOTICE;
DROP TABLE CLASS_IMG;
DROP TABLE CLASS_REVIEW;
DROP TABLE CLASS_REGIST;
DROP TABLE CHAT_MEM;
DROP TABLE CHAT_MESSAGE;
--DROP TABLE CHAT;
DROP TABLE PRODUCT;
DROP TABLE CLASS;
DROP TABLE MEMBER;
DROP TABLE VISIT_COUNT;

-- 시퀀스 삭제 영역
DROP SEQUENCE SEQ_MEM_NO;
DROP SEQUENCE SEQ_SCENT_NO;
DROP SEQUENCE SEQ_PRODUCT_NO;
DROP SEQUENCE SEQ_IMG_NO;
DROP SEQUENCE SEQ_REVIEW_NO;
DROP SEQUENCE SEQ_CART_NO;
DROP SEQUENCE SEQ_ORDER_NO;
DROP SEQUENCE SEQ_OD_ID;
DROP SEQUENCE SEQ_COUPON_NO;
DROP SEQUENCE SEQ_EVENT_NO;
DROP SEQUENCE SEQ_EVENTIMG_NO;
DROP SEQUENCE SEQ_NOTICE_NO;
DROP SEQUENCE SEQ_CLASS_NO;
DROP SEQUENCE SEQ_CLASSIMG_NO;   -- 클래스 이미지와 상품이미지  컬럼 동일(IMG_NO)해서 수정함
DROP SEQUENCE SEQ_REGIST_NO;
DROP SEQUENCE SEQ_CLASS_REVIEW_NO;
DROP SEQUENCE SEQ_CHAT_NO;
DROP SEQUENCE SEQ_CM_NO;
DROP SEQUENCE SEQ_MEM_COUPON_NO;

-- 테이블 생성 영역
---------------- MEMBER ---------------------
CREATE TABLE MEMBER (
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(100) NOT NULL,
    MEM_NAME VARCHAR2(15) NOT NULL,
    EMAIL VARCHAR2(100) ,
    PHONE VARCHAR2(13) ,
    POSTCODE VARCHAR2(200) ,
    ADDRESS VARCHAR2(300) ,
    DETAILADDRESS VARCHAR2(300) ,
    EXTRAADDRESS VARCHAR2(300) ,
    GENDER CHAR(1) CHECK (GENDER IN('F', 'M')),
    BIRTH_DATE DATE,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN MEMBER.MEM_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.MEM_ID IS '아이디';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '이름';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.POSTCODE  IS '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.DETAILADDRESS  IS '상세주소(호수)';
COMMENT ON COLUMN MEMBER.EXTRAADDRESS IS '참고항목';
COMMENT ON COLUMN MEMBER.GENDER IS '성별';
COMMENT ON COLUMN MEMBER.BIRTH_DATE IS '생일';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '정보수정일';
COMMENT ON COLUMN MEMBER.STATUS IS '상태값(Y/N)';

----------------------------------------------
---------------- 향 테이블 --------------------
--CREATE TABLE SCENT(
--    SCENT_NO NUMBER PRIMARY KEY,
--    SCENT_NAME VARCHAR2(60) NOT NULL);
--    
--COMMENT ON COLUMN SCENT.SCENT_NO IS '향 번호';
--COMMENT ON COLUMN SCENT.SCENT_NAME IS '향 이름';

------------------- 상품 테이블 --------------------
CREATE TABLE PRODUCT(
    PRODUCT_NO NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(30) NOT NULL,
    PRODUCT_EXPLAIN VARCHAR2(1000) NOT NULL,
    PRODUCT_PRICE NUMBER NOT NULL,
    PRODUCT_STOCK NUMBER NOT NULL, 
    REGIST_DATE DATE DEFAULT SYSDATE,
    DISCOUNT NUMBER DEFAULT 0,
    CATEGORY VARCHAR2(30) NOT NULL,
    GENDER VARCHAR2(10) NOT NULL,
    TOP_NOTE VARCHAR2(100) NOT NULL,
    MIDDLE_NOTE VARCHAR2(100) NOT NULL,
    BASE_NOTE VARCHAR2(100) NOT NULL,
    PRODUCT_STATUS CHAR(1) DEFAULT 'Y' CHECK (PRODUCT_STATUS IN('Y', 'N')));
	
COMMENT ON COLUMN PRODUCT.PRODUCT_NO IS '제품 번호';
COMMENT ON COLUMN PRODUCT.PRODUCT_NAME IS '제품 이름';
COMMENT ON COLUMN PRODUCT.PRODUCT_EXPLAIN IS '제품 설명';
COMMENT ON COLUMN PRODUCT.PRODUCT_PRICE IS '제품 가격';
COMMENT ON COLUMN PRODUCT.PRODUCT_STOCK IS '재고';
COMMENT ON COLUMN PRODUCT.REGIST_DATE IS '상품 추가일';
COMMENT ON COLUMN PRODUCT.DISCOUNT IS '할인율';
COMMENT ON COLUMN PRODUCT.CATEGORY IS '카테고리';
COMMENT ON COLUMN PRODUCT.GENDER IS '성별';
COMMENT ON COLUMN PRODUCT.TOP_NOTE IS '탑노트';
COMMENT ON COLUMN PRODUCT.MIDDLE_NOTE IS '미들노트';
COMMENT ON COLUMN PRODUCT.BASE_NOTE IS '베이스노트';
COMMENT ON COLUMN PRODUCT.PRODUCT_STATUS IS '상태';

------------------------ 상품 이미지 테이블 -------------
CREATE TABLE PRODUCT_IMG (
    PRODUCT_IMG_NO NUMBER PRIMARY KEY,
    PRODUCT_IMG_PATH VARCHAR2(1000) NOT NULL,
    PRODUCT_IMG_ORIGIN VARCHAR2(1000) NOT NULL,
    PRODUCT_IMG_CHANGE VARCHAR2(1000) NOT NULL,
    IMG_TYPE NUMBER NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN ('Y', 'N')),
    FOREIGN KEY(PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO));

COMMENT ON COLUMN PRODUCT_IMG.PRODUCT_IMG_NO IS '상품 이미지 번호';
COMMENT ON COLUMN PRODUCT_IMG.PRODUCT_IMG_PATH IS '상품 이미지 저장경로';
COMMENT ON COLUMN PRODUCT_IMG.PRODUCT_IMG_ORIGIN IS '상품 원본 이미지';
COMMENT ON COLUMN PRODUCT_IMG.PRODUCT_IMG_CHANGE IS '상품 변경 이미지';
COMMENT ON COLUMN PRODUCT_IMG.IMG_TYPE IS '썸네일(1/2)';
COMMENT ON COLUMN PRODUCT_IMG.PRODUCT_NO IS '제품 번호';

--------------------- 상품 장바구니 ------------------------------
CREATE TABLE CART (
    CART_NO NUMBER PRIMARY KEY,
    PRICE NUMBER NOT NULL,
    QUANTITY NUMBER NOT NULL,
    MEM_NO NUMBER NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO),
    FOREIGN KEY(PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO));

COMMENT ON COLUMN CART.CART_NO IS '장바구니 번호';
COMMENT ON COLUMN CART.PRICE IS '총 가격';
COMMENT ON COLUMN CART.QUANTITY IS '수량';
COMMENT ON COLUMN CART.MEM_NO IS '사용자 번호';
COMMENT ON COLUMN CART.PRODUCT_NO IS '제품 번호';

---------------------- 상품 찜 ----------------------------
CREATE TABLE FAVORITES (
    MEM_NO NUMBER NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO),
    FOREIGN KEY(PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO));

COMMENT ON COLUMN FAVORITES.MEM_NO IS '사용자 번호';
COMMENT ON COLUMN FAVORITES.PRODUCT_NO IS '제품 번호';

---------------------- 상품 주문 -------------------------
CREATE TABLE ORDER_DETAIL (
    ORDER_NO NUMBER PRIMARY KEY,
    PAY_CODE VARCHAR2(50) NOT NULL,
    TOTAL_PRICE NUMBER NOT NULL,
    ORDER_WANT VARCHAR2(300) NOT NULL,
    DELIVERY_STATUS CHAR(1) DEFAULT 'Y' CHECK (DELIVERY_STATUS IN ('Y', 'N')),
    ORDER_DATE DATE DEFAULT SYSDATE,
    REFUND_DATE DATE,
    MEM_NO NUMBER NOT NULL,
    ADDRESS_NO NUMBER,
    ADDRESS VARCHAR2(300),
    PHONE VARCHAR2(13),
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO));

COMMENT ON COLUMN ORDER_DETAIL.ORDER_NO IS '주문번호';
COMMENT ON COLUMN ORDER_DETAIL.PAY_CODE IS '결제코드';
COMMENT ON COLUMN ORDER_DETAIL.TOTAL_PRICE IS '총 결제 금액';
COMMENT ON COLUMN ORDER_DETAIL.ORDER_WANT IS '요청사항';
COMMENT ON COLUMN ORDER_DETAIL.DELIVERY_STATUS IS '배송상태';
COMMENT ON COLUMN ORDER_DETAIL.ORDER_DATE IS '주문일';
COMMENT ON COLUMN ORDER_DETAIL.REFUND_DATE IS '환불일';
COMMENT ON COLUMN ORDER_DETAIL.MEM_NO IS '주문자 번호';
COMMENT ON COLUMN ORDER_DETAIL.ADDRESS_NO IS '우편번호';
COMMENT ON COLUMN ORDER_DETAIL.ADDRESS IS '한글주소';
COMMENT ON COLUMN ORDER_DETAIL.PHONE IS '전화번호';

---------------- 상품-주문 관계테이블 ------------------
CREATE TABLE ORDER_PRODUCT(
    OD_ID NUMBER PRIMARY KEY,
    QUANTITY NUMBER NOT NULL,
    PRICE NUMBER NOT NULL,
    ORDER_NO NUMBER NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    REFUND_REQUEST VARCHAR2(30),
    FOREIGN KEY(ORDER_NO) REFERENCES ORDER_DETAIL(ORDER_NO),
    FOREIGN KEY(PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO));

COMMENT ON COLUMN ORDER_PRODUCT.OD_ID IS '제품-주문 아이디';
COMMENT ON COLUMN ORDER_PRODUCT.QUANTITY IS '수량';
COMMENT ON COLUMN ORDER_PRODUCT.PRICE IS '상품 하나 당 가격';
COMMENT ON COLUMN ORDER_PRODUCT.ORDER_NO IS '주문번호';
COMMENT ON COLUMN ORDER_PRODUCT.PRODUCT_NO IS '제품번호';
COMMENT ON COLUMN ORDER_PRODUCT.REFUND_REQUEST IS '환불요청';


----------------- 상품리뷰 ------------------------
CREATE TABLE PRODUCT_REVIEW (
    REVIEW_NO NUMBER PRIMARY KEY,
    REVIEW_CONTENT VARCHAR2(300) NOT NULL,
    REVIEW_IMG VARCHAR2(1000),
    REVIEW_DATE DATE DEFAULT SYSDATE,
    REVIEW_RATING NUMBER NOT NULL,
    REVIEW_STATUS CHAR(1) DEFAULT 'Y' CHECK (REVIEW_STATUS IN ('Y', 'N')),
    OD_ID NUMBER NOT NULL,
    MEM_NO NUMBER NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    FOREIGN KEY(OD_ID) REFERENCES ORDER_PRODUCT(OD_ID),
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO),
    FOREIGN KEY(PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO));
    
COMMENT ON COLUMN PRODUCT_REVIEW.REVIEW_NO IS '리뷰 번호';
COMMENT ON COLUMN PRODUCT_REVIEW.REVIEW_CONTENT IS '리뷰 내용';
COMMENT ON COLUMN PRODUCT_REVIEW.REVIEW_IMG IS '저장경로+파일수정명';
COMMENT ON COLUMN PRODUCT_REVIEW.REVIEW_DATE IS '작성일';
COMMENT ON COLUMN PRODUCT_REVIEW.REVIEW_RATING IS '평점';
COMMENT ON COLUMN PRODUCT_REVIEW.REVIEW_STATUS IS '상태값';
COMMENT ON COLUMN PRODUCT_REVIEW.OD_ID IS '주문번호';
COMMENT ON COLUMN PRODUCT_REVIEW.MEM_NO IS '회원 번호';
COMMENT ON COLUMN PRODUCT_REVIEW.PRODUCT_NO IS '제품 번호';

------------------------------------------------
-------------------- 쿠폰 -----------------------
CREATE TABLE COUPON (
    COUPON_NO NUMBER PRIMARY KEY,
    COUPON_NAME VARCHAR2(30) NOT NULL);

COMMENT ON COLUMN COUPON.COUPON_NO IS '쿠폰 번호';
COMMENT ON COLUMN COUPON.COUPON_NAME IS '쿠폰 종류';

-------------------- 보유 쿠폰 ----------------------
CREATE TABLE MEM_COUPON (
    MEM_COUPON_NO NUMBER PRIMARY KEY,
    REGIST_DATE DATE NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    MEM_NO NUMBER NOT NULL,
    COUPON_NO NUMBER NOT NULL,
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO),
    FOREIGN KEY(COUPON_NO) REFERENCES COUPON(COUPON_NO));


COMMENT ON COLUMN MEM_COUPON.MEM_NO IS '보유 쿠폰 번호';
COMMENT ON COLUMN MEM_COUPON.MEM_NO IS '회원 번호';
COMMENT ON COLUMN MEM_COUPON.COUPON_NO IS '쿠폰 번호';
COMMENT ON COLUMN MEM_COUPON.REGIST_DATE IS '쿠폰 사용 시작일';
COMMENT ON COLUMN MEM_COUPON.STATUS IS '쿠폰 사용 상태';

------------------- 이벤트 -----------------------
CREATE TABLE EVENT (
    EVENT_NO NUMBER PRIMARY KEY,
    EVENT_TITLE VARCHAR2(60) NOT NULL,
    EVENT_CONTENT VARCHAR2(4000),
    EVENT_COUNT NUMBER DEFAULT 0,
    START_DATE DATE NOT NULL,
    DEW_DATE DATE NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN ('Y', 'N')));
    
COMMENT ON COLUMN EVENT.EVENT_NO IS '이벤트 번호';
COMMENT ON COLUMN EVENT.EVENT_TITLE IS '이벤트 제목';
COMMENT ON COLUMN EVENT.EVENT_CONTENT IS '이벤트 내용';
COMMENT ON COLUMN EVENT.EVENT_COUNT IS '조회수';
COMMENT ON COLUMN EVENT.START_DATE IS '시작일';
COMMENT ON COLUMN EVENT.DEW_DATE IS '종료일';
COMMENT ON COLUMN EVENT.CREATE_DATE IS '작성일';
COMMENT ON COLUMN EVENT.STATUS IS '상태값';

------------------- 이벤트 이미지------------------------
CREATE TABLE EVENT_IMG(
    EVENTIMG_NO NUMBER PRIMARY KEY,
    EVENTIMG_PATH VARCHAR2(1000) NOT NULL,
    EVENTIMG_ORIGIN VARCHAR2(1000) NOT NULL,
    EVENTIMG_CHANGE VARCHAR2(1000) NOT NULL,
    EVENTIMG_LEVEL NUMBER NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN ('Y', 'N')),
    EVENT_NO NUMBER NOT NULL,
    FOREIGN KEY(EVENT_NO) REFERENCES EVENT(EVENT_NO));

COMMENT ON COLUMN EVENT_IMG.EVENTIMG_NO IS '이벤트이미지 번호';
COMMENT ON COLUMN EVENT_IMG.EVENTIMG_PATH IS '이벤트이미지 경로';
COMMENT ON COLUMN EVENT_IMG.EVENTIMG_ORIGIN IS '이벤트 원본 이미지';
COMMENT ON COLUMN EVENT_IMG.EVENTIMG_CHANGE IS '이벤트 변경 이미지';
COMMENT ON COLUMN EVENT_IMG.EVENTIMG_LEVEL IS '이벤트이미지 종류';
COMMENT ON COLUMN EVENT_IMG.STATUS IS '상태';
COMMENT ON COLUMN EVENT_IMG.EVENT_NO IS '이벤트 번호';

------------------------공지-------------------------
CREATE TABLE NOTICE(
    NOTICE_NO NUMBER PRIMARY KEY,
    NOTICE_TITLE VARCHAR2(100) NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000),
    NOTICE_COUNT NUMBER DEFAULT 0,
    CREATE_DATE DATE DEFAULT SYSDATE,
    NOTICE_IMG_PATH VARCHAR2(1000),
    NOTICE_IMG_ORIGIN VARCHAR2(1000),
    NOTICE_IMG_CHANGE VARCHAR2(1000),
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN ('Y', 'N')));
    
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항 번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지사항 내용';
COMMENT ON COLUMN NOTICE.NOTICE_COUNT IS '조회수';
COMMENT ON COLUMN NOTICE.CREATE_DATE IS '게시일자';
COMMENT ON COLUMN NOTICE.NOTICE_IMG_PATH IS '공지사항 이미지 경로';
COMMENT ON COLUMN NOTICE.NOTICE_IMG_ORIGIN IS '공지 원본 이미지';
COMMENT ON COLUMN NOTICE.NOTICE_IMG_CHANGE IS '공지 변경 이미지';
COMMENT ON COLUMN NOTICE.STATUS IS '상태';
------------------ 원데이 클래스 ------------------
CREATE TABLE CLASS(
    CLASS_NO NUMBER PRIMARY KEY,
    CLASS_NAME VARCHAR2(300) NOT NULL,
    CLASS_TEACHER VARCHAR2(15) NOT NULL,
    STUDENT_MAXNO NUMBER NOT NULL,
    CLASS_DETAIL VARCHAR2(4000),
    PRICE NUMBER NOT NULL,
    START_TIME DATE ,
    END_TIME DATE ,
    START_DATE DATE DEFAULT SYSDATE,
    ENROLL_DATE DATE ,
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN ('Y', 'N')));
   
COMMENT ON COLUMN CLASS.CLASS_NO IS '클래스 번호';
COMMENT ON COLUMN CLASS.CLASS_NAME IS '클래스 명';
COMMENT ON COLUMN CLASS.CLASS_TEACHER IS '강사명';
COMMENT ON COLUMN CLASS.STUDENT_MAXNO IS '최대 수강 인원';
COMMENT ON COLUMN CLASS.CLASS_DETAIL IS '클래스 설명';
COMMENT ON COLUMN CLASS.PRICE IS '가격';
COMMENT ON COLUMN CLASS.START_TIME IS '시작시간';
COMMENT ON COLUMN CLASS.END_TIME IS '종료시간';
COMMENT ON COLUMN CLASS.START_DATE IS '개강 일자';
COMMENT ON COLUMN CLASS.ENROLL_DATE IS '등록일';
COMMENT ON COLUMN CLASS.STATUS IS '폐강여부';

---------------- 원데이 클래스 이미지 ----------------
CREATE TABLE CLASS_IMG(
    CLASS_IMG_NO NUMBER PRIMARY KEY, 
    CLASS_IMG_PATH VARCHAR2(1000) NOT NULL,
    CLASS_IMG_ORIGIN VARCHAR2(1000) NOT NULL,
    CLASS_IMG_CHANGE VARCHAR2(1000) NOT NULL,
    CLASS_IMG_TYPE NUMBER NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    REF_CNO NUMBER NOT NULL,
    FOREIGN KEY(REF_CNO) REFERENCES CLASS(CLASS_NO));

COMMENT ON COLUMN CLASS_IMG.CLASS_IMG_NO IS '상품이미지번호';
COMMENT ON COLUMN CLASS_IMG.CLASS_IMG_PATH IS '저장경로';
COMMENT ON COLUMN CLASS_IMG.CLASS_IMG_ORIGIN IS '원데이 원본 이미지';
COMMENT ON COLUMN CLASS_IMG.CLASS_IMG_CHANGE IS '원데이 변경 이미지';
COMMENT ON COLUMN CLASS_IMG.CLASS_IMG_TYPE IS '썸네일(1/2)';
COMMENT ON COLUMN CLASS_IMG.STATUS IS '상태값';
COMMENT ON COLUMN CLASS_IMG.REF_CNO IS '참조 클래스 번호';

-------------------- 클래스 신청 --------------------
CREATE TABLE CLASS_REGIST(
    REGIST_NO VARCHAR2(500) PRIMARY KEY,
    REGIST_PAYCODE VARCHAR2(500) NOT NULL,
    REGIST_PRICE NUMBER NOT NULL,
    REGIST_PERSON_NO NUMBER NOT NULL,
    REGIST_DATE DATE NOT NULL,
    REGIST_CANCEL_DATE DATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    CLASS_NO NUMBER NOT NULL,
    MEM_NO NUMBER NOT NULL,
    FOREIGN KEY(CLASS_NO) REFERENCES CLASS(CLASS_NO),
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO));
    
COMMENT ON COLUMN CLASS_REGIST.REGIST_NO IS '신청 번호';
COMMENT ON COLUMN CLASS_REGIST.REGIST_PAYCODE IS '원데이결제번호';
COMMENT ON COLUMN CLASS_REGIST.REGIST_PRICE IS '결제 가격';
COMMENT ON COLUMN CLASS_REGIST.REGIST_PERSON_NO IS '신청 인원';
COMMENT ON COLUMN CLASS_REGIST.REGIST_DATE  IS '신청일';
COMMENT ON COLUMN CLASS_REGIST.REGIST_CANCEL_DATE  IS '취소일';
COMMENT ON COLUMN CLASS_REGIST.STATUS  IS '상태';
COMMENT ON COLUMN CLASS_REGIST.CLASS_NO IS '클래스 번호';
COMMENT ON COLUMN CLASS_REGIST.MEM_NO IS '회원 번호';

---------------------- 클래스 후기 -------------------
CREATE TABLE CLASS_REVIEW(
    CLASS_REVIEW_NO NUMBER PRIMARY KEY,
    CLASS_REVIEW_CONTENT VARCHAR2(300) NOT NULL,  
    LIST_NO VARCHAR2(500) NOT NULL,
    MEM_NO NUMBER NOT NULL,
    FOREIGN KEY(LIST_NO) REFERENCES CLASS_REGIST(REGIST_NO),
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO));

COMMENT ON COLUMN CLASS_REVIEW.CLASS_REVIEW_NO IS '후기 번호';
COMMENT ON COLUMN CLASS_REVIEW.CLASS_REVIEW_CONTENT IS '후기 내용';
COMMENT ON COLUMN CLASS_REVIEW.LIST_NO IS '신청 번호';
COMMENT ON COLUMN CLASS_REVIEW.MEM_NO IS '회원 번호';

---------------------- 채팅방 ------------------
-- CREATE TABLE CHAT(
--    CHAT_NO NUMBER PRIMARY KEY,
--    CLASS_NO NUMBER NOT NULL,
--    FOREIGN KEY(CLASS_NO) REFERENCES CLASS(CLASS_NO));
--
--COMMENT ON COLUMN CHAT.CHAT_NO IS '채팅방 번호';
--COMMENT ON COLUMN CHAT.CLASS_NO IS '회원 번호';

------------------- 채팅창 참여멤버 ----------------
CREATE TABLE CHAT_MEM(
    CLASS_NO NUMBER NOT NULL,
    MEM_NO NUMBER,
    FOREIGN KEY(CLASS_NO) REFERENCES CLASS(CLASS_NO),
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO));
    
COMMENT ON COLUMN CHAT_MEM.CLASS_NO IS '클래스 번호';
COMMENT ON COLUMN CHAT_MEM.MEM_NO IS '회원 번호';

------------------ 채팅 메세지 --------------------
CREATE TABLE CHAT_MESSAGE(
    CM_NO NUMBER PRIMARY KEY,
    CM_CONTENT VARCHAR2(300) NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE,
    CLASS_NO NUMBER NOT NULL,
    MEM_NO NUMBER NOT NULL,
    FOREIGN KEY(CLASS_NO) REFERENCES CLASS(CLASS_NO),
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO));

COMMENT ON COLUMN CHAT_MESSAGE.CM_NO IS '채팅 메세지 번호';
COMMENT ON COLUMN CHAT_MESSAGE.CM_CONTENT IS '메세지 내용';
COMMENT ON COLUMN CHAT_MESSAGE.CREATE_DATE IS '작성 시간';
COMMENT ON COLUMN CHAT_MESSAGE.CLASS_NO IS '클래스 번호';
COMMENT ON COLUMN CHAT_MESSAGE.MEM_NO IS '회원 번호';


--------------------------방문자 수 관련-----------------------

CREATE TABLE VISIT_COUNT (
 VISIT_DATE DATE NOT NULL
);

COMMENT ON COLUMN VISIT_COUNT .VISIT_DATE IS '접속일자';
 

-- 시퀀스 생성 영역
CREATE SEQUENCE SEQ_MEM_NO;
CREATE SEQUENCE SEQ_SCENT_NO;
CREATE SEQUENCE SEQ_PRODUCT_NO;
CREATE SEQUENCE SEQ_IMG_NO;
CREATE SEQUENCE SEQ_REVIEW_NO;
CREATE SEQUENCE SEQ_CART_NO;
CREATE SEQUENCE SEQ_ORDER_NO;
CREATE SEQUENCE SEQ_OD_ID;
CREATE SEQUENCE SEQ_COUPON_NO;
CREATE SEQUENCE SEQ_EVENT_NO;
CREATE SEQUENCE SEQ_EVENTIMG_NO;
CREATE SEQUENCE SEQ_NOTICE_NO;
CREATE SEQUENCE SEQ_CLASS_NO;
CREATE SEQUENCE SEQ_CLASSIMG_NO; // 클래스 이미지와 상품이미지  컬럼 동일(IMG_NO)해서 수정함
CREATE SEQUENCE SEQ_REGIST_NO;
CREATE SEQUENCE SEQ_CLASS_REVIEW_NO;
CREATE SEQUENCE SEQ_CHAT_NO;
CREATE SEQUENCE SEQ_CM_NO;
CREATE SEQUENCE SEQ_MEM_COUPON_NO; -- 쿠폰 증정 테이블 PK 용 시퀀스
