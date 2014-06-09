/*
 
  
*/


SET foreign_key_checks = 0; #turn off constraints temporarily

#since constraints cause problems, drop tables first, working backward
DROP TABLE IF EXISTS sprint_comany_gig;
DROP TABLE IF EXISTS sprint_student_initial;
DROP TABLE IF EXISTS sprint_student_skill;


CREATE TABLE sprint_company_gig(
CompanyGigID INT UNSIGNED NOT NULL AUTO_INCREMENT,
CompanyName VARCHAR(255),
WebSite VARCHAR(255) DEFAULT 'www.companysite.com',
ContactEmail VARCHAR(255),
CompanyPhone INT,
TypeofGig ENUM('Full Time','Part Time','Volunteer','Contract','Intership') NULL,
Location VARCHAR(255),
Category VARCHAR(255),
PositionTitle VARCHAR(255),
Description TEXT,
DateAdded DATETIME,
LastUpdated TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (CompanyGigID)
)ENGINE=INNODB;


INSERT INTO sprint_company_gig values (NULL,'CodingTube','www.codingtube.com','codingtube@codingtube.com','1234567890','Volunteer','Greater Seattle Area','Designer','Entry Level Designer','',NOW(),NOW());

CREATE TABLE sprint_student_initial(
StudentID INT UNSIGNED NOT NULL,
FirstName VARCHAR(255),
LastName VARCHAR(255),
EmailAddress VARCHAR(255),
Password VARCHAR(255),
PasswordValidation VARCHAR(255),
Phone INT,
Portfolio VARCHAR(255),
LinkedIn VARCHAR(255),
GitHub VARCHAR(255),
Facebook VARCHAR(255),
AreasInterest SET('Design','Front end Development','Back end Development/Server Side','Database','Networking/Hardware/IT','Additional information') NULL,
JobTimeline SET('Part Time','Full Time','Temp','Permanant') NULL,
EducationLevel SET('Associate Degree','Certificate','In progress') NULL,

PRIMARY KEY (StudentID)
)ENGINE=INNODB; 


INSERT INTO sprint_student_initial values ('123456789','Anne','Jone','ajone@gmail.com','abcd','abcd',1234567890,'','https://github.com/anneJone','','Design','Part Time','Certificate');


CREATE TABLE sprint_student_skill(
SkillID INT UNSIGNED NOT NULL AUTO_INCREMENT,
StudentID INT UNSIGNED DEFAULT 0,
SkillHtml SET('HTML','CSS','Bootstrap','Zurb','Foundation','LESS') NULL,
SkillJavaScript SET('JavaScript','jQuery','Handlebars','AngularJS','JSON','Other') NULL,
SkillPHP SET('PHP','SQL','Laravel','CodeIgniter','Zend','CakePHP','Other') NULL,
SkillRuby SET('Ruby','Rails','Sinatra','Padrino','Other') NULL,
OtherLanguages SET('Java','C#','ASP.NET','Other') NULL,
LayOut SET('Adobe Illustrator','Adobe Photoshop','Adobe inDesign','Adobe Flash','Other') NULL,
PRIMARY KEY (SkillID),
INDEX StudentID_index(StudentID),
FOREIGN KEY (StudentID) REFERENCES sprint_student_information(StudentID) ON DELETE CASCADE
)ENGINE=INNODB;

INSERT INTO srv_questions VALUES (NULL,'123456789','HTML','jAVAsCRIPT','PHP','Ruby','Java','Adobe Photoshop');

SET foreign_key_checks = 1; #turn foreign key check back on