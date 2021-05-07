# KT-ds-University-17th-web-application-project

<img src="https://img.shields.io/badge/Spring-6DB33F?style=flat&logo=Spring&logoColor=white"/> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white"/> <img src="https://img.shields.io/badge/Oracle DB-F80000?style=flat&logo=Oracle&logoColor=white"/>

<img src="https://img.shields.io/badge/Jquery-0769AD?style=flat&logo=Jquery&logoColor=white"/> <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat&logo=tomcat&logoColor=white"/> <img src="https://img.shields.io/badge/Amazon AWS-232F3E?style=flat&logo=amazonaws&logoColor=white"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"/>


## How to Run

1. clone to your Project Folder

2. make jdbc.properties in path "src/main/webapp/WEB-INF/config"

3. change pom.xml line 168, [system path]

4. setting Tomcat in Project Folder

5. make 'mailkey.properties' in path [springEx/src/main/resources]

6. make 'global.jsp' in path [springEx/src/main/webapp/WEB-INF/config] kakao api setting

7. Servers > server.xml = [156번 째 줄에 추가] <Context docBase="springEx" path="/ktu" reloadable="true" source="org.eclipse.jst.jee.server:springEx"/></Host>

8. File upload Settings

springEx> [file폴더 생성]
FileUtils.java = [18번째줄에 추가] "C:\\Users\\rkdal\\Downloads\\projectTest\\KT-ds-University-17th-web-application-project\\file\\";
NoticeController.java = [277번째 줄에 추가] "C:\\Users\\rkdal\\Downloads\\projectTest\\KT-ds-University-17th-web-application-project\\file\\" (=본인 workspace file 폴더경로)

springEx>src>main>webapp>resources>[resume 폴더생성]
ResumeController.java = [158번째 줄에 추가] "C:\\Users\\rkdal\\Downloads\\projectTest\\KT-ds-University-17th-web-application-project\\src\\main\\webapp\\resources\\image\\resume\\"; (=본인 workspace resume 폴더경로)

9. Start our Project!!

## ER - Diagram

![er-Diagram](https://user-images.githubusercontent.com/62874963/117421871-edb5d900-af59-11eb-98ba-9c2f04d69b05.png)


## Main Page

![image](https://user-images.githubusercontent.com/62874963/117422138-3bcadc80-af5a-11eb-8a91-727aabbec1b2.png)

