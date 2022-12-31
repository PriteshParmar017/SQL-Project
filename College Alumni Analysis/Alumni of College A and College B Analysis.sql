-- 1. Create new schema as alumni
CREATE database alumni;
use alumni;

-- 2. Import all .csv files into MySQL
-- Data import csv file done through navigator.

-- 3. Run SQL command to see the structure of six tables
DESC college_a_hs;   -- 1157 rows of data
DESC college_a_se;   -- 1016  rows of data  
DESC college_a_sj;   -- 5633 rows of data  
DESC college_b_hs;   -- 199 rows of data
DESC college_b_se;   -- 201 rows of data
DESC college_b_sj;   -- 1859 rows of data


-- 4. Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python.
-- ipynb file attacted.

-- 5. Import first 1500 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) into MS Excel.
-- excel file attached.



-- 6. Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values. 
create view College_A_HS_V as select * from college_a_hs where length(RollNo) > 0 and length(LastUpdate) > 0 and length(Name) > 0 and
length(FatherName) > 0 and length(MotherName) > 0 and length(Batch) > 0 and length(Degree) > 0 and length(PresentStatus) > 0 and
length(HSDegree) > 0 and length(EntranceExam) > 0 and length(Institute) > 0 and length(Location) > 0;



-- 7. Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.
create view College_A_SE_V as select * from college_a_se where length(RollNo) > 0 and length(LastUpdate) > 0 and length(Name) > 0 and
length(FatherName) > 0 and length(MotherName) > 0 and length(Batch) > 0 and length(Degree) > 0 and length(PresentStatus) > 0 and
length(Organization) > 0 and length(Location) > 0;



-- 8. Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.
create view College_A_SJ_V as select * from college_a_sj where length(RollNo) > 0 and length(LastUpdate) > 0 and length(Name) > 0 and
length(FatherName) > 0 and length(MotherName) > 0  and length(Batch) > 0 and length(Degree) > 0 and length(PresentStatus) > 0 and
length(Organization) > 0 and length(Designation) > 0 and length(Location) > 0;



-- 9. Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.
create view College_B_HS_V as select * from college_b_hs where length(RollNo) > 0 and length(LastUpdate) > 0 and length(Name) > 0 and
length(FatherName) > 0 and length(MotherName) > 0 and length(Branch) > 0 and length(Batch) > 0 and length(Degree) > 0 and length(PresentStatus) > 0 and
length(HSDegree) > 0 and length(EntranceExam) > 0 and length(Institute) > 0 and length(Location) > 0;



-- 10. Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.
create view College_B_SE_V as select * from college_b_se where length(RollNo) > 0 and length(LastUpdate) > 0 and length(Name) > 0 and
length(FatherName) > 0 and length(MotherName) > 0 and length(Branch) > 0 and length(Batch) > 0 and length(Degree) > 0 and length(PresentStatus) > 0 and
length(Organization) > 0 and length(Location) > 0;



-- 11. Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.
create view College_B_SJ_V as select * from college_b_sj where length(RollNo) > 0 and length(LastUpdate) > 0 and length(Name) > 0 and
length(FatherName) > 0 and length(MotherName) > 0 and length(Branch) > 0 and length(Batch) > 0 and length(Degree) > 0 and length(PresentStatus) > 0 and
length(Organization) > 0 and length(Designation) > 0 and length(Location) > 0;



-- 12. Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views
--  (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 
DELIMITER //
CREATE PROCEDURE lowercollegeahs ()
BEGIN
    SELECT lower(Name) Name, lower(FatherName) Father_Name, lower(MotherName) Mother_Name from college_a_hs_v;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE lowercollegease ()
BEGIN
    SELECT lower(Name) Name, lower(FatherName) Father_Name, lower(MotherName) Mother_Name from college_a_se_v;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE lowercollegeasj ()
BEGIN
    SELECT lower(Name) Name, lower(FatherName) Father_Name, lower(MotherName) Mother_Name from college_a_sj_v;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE lowercollegebhs ()
BEGIN
    SELECT lower(Name) Name, lower(FatherName) Father_Name, lower(MotherName) Mother_Name from college_b_hs_v;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE lowercollegebse ()
BEGIN
    SELECT lower(Name) Name, lower(FatherName) Father_Name, lower(MotherName) Mother_Name from college_b_se_v;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE lowercollegebsj ()
BEGIN
    SELECT lower(Name) Name, lower(FatherName) Father_Name, lower(MotherName) Mother_Name from college_b_sj_v;
END //
DELIMITER ;

CALL lowercollegeahs ();
CALL lowercollegease ();
CALL lowercollegeasj ();
CALL lowercollegebhs ();
CALL lowercollegebse ();
CALL lowercollegebsj ();





-- 13. Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 
-- into MS Excel and make pivot chart for location of Alumni. 
-- excel file attached.




-- 14. Write a query to create procedure get_name_collegeA using the cursor to fetch names of all students from college A.

DELIMITER //
CREATE PROCEDURE get_name_collegeA (INOUT ndetaila text(50000))
BEGIN
	DECLARE finish INT DEFAULT 0;
    DECLARE namelist VARCHAR(400) DEFAULT "";
    DECLARE namedetail CURSOR FOR SELECT Name FROM  college_a_hs union SELECT Name FROM  college_a_se union SELECT Name FROM  college_a_sj;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finish = 1;
    OPEN namedetail;
	getdetail:
		LOOP
			FETCH namedetail INTO namelist;
			IF finish = 1 THEN LEAVE getdetail;
            END IF;
			SET ndetaila = CONCAT ( namelist," ; ", ndetaila);
		END LOOP getdetail;
    CLOSE namedetail;
END //
DELIMITER ;

SET @ndetaila ="";
CALL get_name_collegeA(@ndetaila);
SELECT @ndetaila as Name;

 
 
 
 
 
-- 15. Write a query to create procedure get_name_collegeB using the cursor to fetch names of all students from college B.
DELIMITER //
CREATE PROCEDURE get_name_collegeB (INOUT ndetailb text(50000))
BEGIN
	DECLARE finish INT DEFAULT 0;
    DECLARE namelist VARCHAR(400) DEFAULT "";
    DECLARE namedetail CURSOR FOR SELECT Name FROM  college_b_hs union SELECT Name FROM  college_b_se union SELECT Name FROM  college_b_sj;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finish = 1;
    OPEN namedetail;
	getdetail:
		LOOP
			FETCH namedetail INTO namelist;
			IF finish = 1 THEN LEAVE getdetail;
            END IF;
			SET ndetailb = CONCAT ( namelist," ; ", ndetailb);
		END LOOP getdetail;
    CLOSE namedetail;
END //
DELIMITER ;

SET @ndetailb ="";
CALL get_name_collegeB(@ndetailb);
SELECT @ndetailb as Name;


-- 16 Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job)
-- Note: Approximate percentages are considered for career choices.


select 'Higher Studies', 'College A Percentage', 'College B Percentage'
UNION

select 'Higher Studies',  (select count(*) from college_a_hs)/ ((select count(*) from college_a_hs) + 
(select count(*) from college_a_se) + (select count(*) from college_a_sj)) * 100,  
(select count(*) from college_b_hs)/ ((select count(*) from college_b_hs) + 
(select count(*) from college_b_se) + (select count(*) from college_b_sj)) * 100

UNION
select 'Self Employed',  (select count(*) from college_a_se)/ ((select count(*) from college_a_hs) + 
(select count(*) from college_a_se) + (select count(*) from college_a_sj)) * 100,  
(select count(*) from college_b_se)/ ((select count(*) from college_b_hs) + 
(select count(*) from college_b_se) + (select count(*) from college_b_sj)) * 100

UNION
select 'Service Job',  (select count(*) from college_a_sj)/ ((select count(*) from college_a_hs) + 
(select count(*) from college_a_se) + (select count(*) from college_a_sj)) * 100, 
(select count(*) from college_b_sj)/ ((select count(*) from college_b_hs) + 
(select count(*) from college_b_se) + (select count(*) from college_b_sj)) * 100;














