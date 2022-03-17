-- 영화정보 구축

drop database if exists 영화db;

CREATE DATABASE  if not exists 영화db;





drop user if exists r_tari@localhost;

create user if not exists r_tari@localhost identified by 'rtari';
GRANT ALL PRIVILEGES ON 영화db.* to r_tari@localhost;
show databases;
use 영화db;

-- -----------------------------------------------------
-- Schema 영화db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 영화db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `영화db` DEFAULT CHARACTER SET utf8 ;
USE `영화db` ;

-- -----------------------------------------------------
-- Table `영화db`.`배우`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `영화db`.`배우` (
  `주민번호` VARCHAR(15) NOT NULL,
  `이름` VARCHAR(20) NOT NULL,
  `성별` BIT(1) NOT NULL,
  `출생지` VARCHAR(20) NOT NULL,
  `키` VARCHAR(3) NOT NULL,
  `몸무게` VARCHAR(3) NOT NULL,
  `혈액형` VARCHAR(2) NOT NULL,
  `배역` VARCHAR(45) NULL,
  PRIMARY KEY (`주민번호`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `영화db`.`장르`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `영화db`.`장르` (
  `장르코드` VARCHAR(20) NOT NULL,
  `장르명` VARCHAR(30) NULL,
  PRIMARY KEY (`장르코드`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `영화db`.`감독`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `영화db`.`감독` (
  `감독등록번호` CHAR(5) NOT NULL,
  `이름` VARCHAR(20) NULL,
  `성별` BIT(1) NULL,
  `출생일` VARCHAR(20) NULL,
  `출생지` VARCHAR(20) NULL,
  `학력` VARCHAR(20) NULL,
  `캐스팅_` INT NOT NULL,
  PRIMARY KEY (`감독등록번호`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `영화db`.`영화`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `영화db`.`영화` (
  `영화코드` VARCHAR(20) NOT NULL DEFAULT '0001',
  `제목` VARCHAR(30) NOT NULL,
  `제작년도` VARCHAR(20) NOT NULL,
  `상영시간` VARCHAR(10) NOT NULL,
  `개봉일자` VARCHAR(20) NOT NULL,
  `제작사` VARCHAR(30) NOT NULL,
  `배급사` VARCHAR(30) NOT NULL,
  `배우주민번호` VARCHAR(15) NOT NULL,
  `장르코드` VARCHAR(20) NOT NULL,
  `감독_감독등록번호` CHAR(5) NOT NULL,
  PRIMARY KEY (`영화코드`),
  INDEX `fk_영화_배우1_idx` (`배우주민번호` ASC) VISIBLE,
  INDEX `fk_영화_장르1_idx` (`장르코드` ASC) VISIBLE,
  INDEX `fk_영화_감독1_idx` (`감독_감독등록번호` ASC) VISIBLE,
  CONSTRAINT `fk_영화_배우1`
    FOREIGN KEY (`배우주민번호`)
    REFERENCES `영화db`.`배우` (`주민번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_영화_장르1`
    FOREIGN KEY (`장르코드`)
    REFERENCES `영화db`.`장르` (`장르코드`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_영화_감독1`
    FOREIGN KEY (`감독_감독등록번호`)
    REFERENCES `영화db`.`감독` (`감독등록번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `영화db`.`캐스팅`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `영화db`.`캐스팅` (
  `영화_영화코드` VARCHAR(20) NOT NULL,
  `감독_감독등록번호` CHAR(5) NOT NULL,
  `배우_주민번호` VARCHAR(15) NOT NULL,
  INDEX `fk_캐스팅_영화1_idx` (`영화_영화코드` ASC) VISIBLE,
  INDEX `fk_캐스팅_감독1_idx` (`감독_감독등록번호` ASC) VISIBLE,
  INDEX `fk_캐스팅_배우1_idx` (`배우_주민번호` ASC) VISIBLE,
  CONSTRAINT `fk_캐스팅_영화1`
    FOREIGN KEY (`영화_영화코드`)
    REFERENCES `영화db`.`영화` (`영화코드`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_캐스팅_감독1`
    FOREIGN KEY (`감독_감독등록번호`)
    REFERENCES `영화db`.`감독` (`감독등록번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_캐스팅_배우1`
    FOREIGN KEY (`배우_주민번호`)
    REFERENCES `영화db`.`배우` (`주민번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- insert 장르
-- -----------------------------------------------------


    insert into 장르
    value(
				'100001',
				'Romantic comedy'
			);
            
	 insert into 장르
    value(
				'100002',
				'액션'
			);
            
	 insert into 장르
    value(
				'100003',
				'스릴러'
			);
            
	 insert into 장르
    value(
				'100004',
				'호러'
			);
            
	 insert into 장르
    value(
				'100005',
				'드라마'
			);
            
	 insert into 장르
    value(
				'100006',
				'포르노'
			);
            
	select* 
    from 장르;
    
    
    

-- -----------------------------------------------------
-- insert 감독
-- -----------------------------------------------------
    
    insert into 감독
    value(
				'30001',
                '봉주노',
                1,
                '1982-08-09',
                '강원도',
                '서울대학교',
                '0001'
			);
            
	insert into 감독
    value(
				'30002',
                '박차눅',
                1,
                '1987-12-11',
                '서울특별시',
                '건국대학교',
                '0002'
			);
            
	insert into 감독
    value(
				'30003',
                '김보랑',
                0,
                '1989-03-06',
                '인천광역시',
                '경희대학교',
                '0003'
			);
            
	insert into 감독
    value(
				'30004',
                '장준한',
                1,
                '1972-05-09',
                '충청도',
                '국민대학교',
                '0004'
			);
            
	insert into 감독
    value(
				'30005',
                '하정오',
                1,
                '1983-02-19',
                '강원도',
                '한국예술대학교',
                '0005'
			);
            
	insert into 감독
    value(
				'30006',
                '방은진',
                0,
                '1967-12-11',
                '전라도',
                '전북대학교',
                '0006'
			);
            
	insert into 감독
    value(
				'30007',
                '유승완',
                1,
                '1973-12-15',
                '충청도',
                '고졸',
                '0007'
			);
            
	insert into 감독
    value(
				'30008',
                '이옥섬',
                0,
                '1987-05-29',
                '서울특별시',
                '서울예술대학교',
                '0008'
			);
            
        
            
            
            select  감독등록번호,이름, 
					case when 성별=1 then '남'
					else '여' end as 성별,
					출생일,출생지,학력
     from 감독;
            
            
            
            
-- -----------------------------------------------------
-- insert 배우
-- -----------------------------------------------------
            
            
insert into 배우
value(
			'870402-1154218',
            '하바드', 
            1,
            '충청도',
            '187',
            '90',
            'AB',
            '방랑자'
            
            );
            
            
insert into 배우
value(
			'720712-134588',
            '최민석', 
            1,
            '강원도',
            '177',
            '80',
            'B',
            '주인공'
         
            );
            
insert into 배우
value(
			'790503-1123457',
            '송강오', 
            1,
            '서울특별시',
            '173',
            '83',
            'A',
            '악역'
          
            );
            
insert into 배우
value(
			'820607-2257898',
            '오원서', 
            0,
            '서울특별시',
            '167',
            '58',
            'O',
            '주인공'
      
            );
            
insert into 배우
value(
			'790830-1467728',
            '심하균', 
            1,
            '전라도',
            '17',
            '90',
            'AB',
            '무당'
    
            );
            
insert into 배우
value(
			'873751-1152218',
            '라군아', 
            1,
            '강원도',
            '182',
            '87',
            'A',
            '바이킹'
    
            );
            
insert into 배우
value(
			'920725-2142182',
            '이상경', 
            0,
            '서울특별시',
            '175',
            '52',
            'B',
            '여주인공'
      
            );
            
insert into 배우
value(
			'752022-1746128',
            '정영석', 
            1,
            '인천광역시',
            '170',
            '65',
            'AB',
            '국회의원'
    
            );
            

	
        
	 select  주민번호,이름, 
					case when 성별=1 then '남'
					else '여' end as 성별,
					출생지,키,몸무게,혈액형
     from 배우 ;
    
    
   -- -----------------------------------------------------
	-- insert 영화
	-- ----------------------------------------------------- 
    insert into 영화
    value(
				'0001',
                '기생종',
                '2019',
                '02:10:23',
                '2019-08-23',
                '코리아컬쳐웍스',
                'TK 엔터',
                '870402-1154218',
                '100003',
                 '30001'
			);
	 insert into 영화
    value(
				'0002',
                '1950',
                '2021',
                '01:40:45',
                '2021-10-19',
                '롯데컬쳐웍스',
                '롯데엔터테인먼트',
                '720712-134588',
                '100002',
                '30002'
			);
            
	 insert into 영화
    value(
				'0003',
                '엑시',
                '2017',
                '02:25:07',
                '2017-02-17',
                '삼성영상사업단',
                '쇼박스',
                '820607-2257898',
                '100004',
                '30003'
           
			);
            
	 insert into 영화
    value(
				'0004',
                '악어',
                '2020',
                '01:40:47',
                '2020-11-12',
                '사나이픽처스',
                'NEW',
                '790503-1123457',
                '100004',
                '30004'
			);
            
	 insert into 영화
    value(
				'0005',
                '노인',
                '2015',
                '02:02:34',
                '2015-09-24',
                '명필름',
                '대우시네마',
                '790830-1467728',
                '100005',
                 '30005'
			);
            
	 insert into 영화
    value(
				'0006',
                '부엉이',
                '2022',
                '01:30:54',
                '2022-01-24',
                '동아수출공사',
                '미도영화사',
                '873751-1152218',
                '100006',
                '30006'
			);
            
	 insert into 영화
    value(
				'0007',
                '침입',
                '2018',
                '01:47:24',
                '2018-08-30',
                '대원미디어',
                '금강기획',
                '920725-2142182',
                '100003',
                '30007'
			);
            
	 insert into 영화
    value(
				'0008',
                '사계',
                '2020',
                '02:12:28',
                '2020-08-19',
                '광화문시네마',
                '한컴',
                '752022-1746128',
                '100001',
                 '30008'
			);
    
    select * from 영화;
        
        
        
      -- -----------------------------------------------------
	-- insert 캐스팅
	-- -----------------------------------------------------    
        insert 캐스팅
        value (
					'0001',
                    '30001',
                    '870402-1154218'
                    );
                    
		 insert 캐스팅
        value (
					'0002',
                    '30002',
                    '720712-134588'
                    );
                    
		 insert 캐스팅
        value (
					'0003',
                    '30003',
                    '820607-2257898'
                    );
                    
		 insert 캐스팅
        value (
					'0004',
                    '30004',
                    '790503-1123457'
                    );
                    
		 insert 캐스팅
        value (
					'0005',
                    '30005',
                    '790830-1467728'
                    );
                    
		 insert 캐스팅
        value (
					'0006',
                    '30006',
                    '873751-1152218'
                    );
                    
		 insert 캐스팅
        value (
					'0007',
                    '30008',
                    '920725-2142182'
                    );
                    
		 insert 캐스팅
        value (
					'0008',
                    '30008',
                    '752022-1746128'
                    );
                    
		select* from 캐스팅;
                    
		
                    
        
        
--  4 2020년에 제작된 영화의 편수를 구하시오 
        
			select 장르명, count(장르.장르코드) as 제작편수
			from 장르  join 영화 on 영화.장르코드= 장르.장르코드
            where 영화.제작년도 ='2020'
            group by 장르명;
            
			
             
-- 5 romantic comedy에 출연하지 않은 배우목록

select 배우.이름
from 배우  join 영화 on 배우.주민번호=영화.배우주민번호
where 장르코드 not in('100001') ;


-- 6 romantic comedy 자료 장르코드와 장르명 000111과 로맨틱 코미디로 변경 
-- 어제와 같은 오류 1451,1452 에러
/*
update 장르 set 장르명='로맨틱 코미디', 장르코드='000111'
where 장르명='Romantic comedy';

update 영화 set  장르코드='000111'
where 장르코드 in(select 장르코드 from 장르 where 장르명 = 'Romantic comedy');

select * 
from 장르;
select * 
from 영화;
*/
--  7 장르가 포르노에 해당하는 영화 정보 삭제

delete from 캐스팅
where 영화_영화코드 ='0006';

delete from 영화
 where 장르코드='100006';
 
 delete from 배우
where 주민번호 ='873751-1152218';

 delete from 감독
where 감독등록번호 ='30006';

 
 

 select  주민번호,이름, 
					case when 성별=1 then '남'
					else '여' end as 성별,
					출생지,키,몸무게,혈액형,배역
     from 배우;

 select  감독등록번호,이름, 
					case when 성별=1 then '남'
					else '여' end as 성별,
					출생일,출생지,학력
     from 감독;

select* 
from 영화;




