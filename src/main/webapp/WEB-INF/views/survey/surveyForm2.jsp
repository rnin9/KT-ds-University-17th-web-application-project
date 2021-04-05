<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html>
 <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
       
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                            	<th>answerId</th>
                                            	<th>surveyId</th>
                                                <th>Name</th>
                                                <th>Q1</th>
                                                <th>Q2</th>
                                                <th>Q3</th>
                                                <th>Q4</th>
                                                <th>Q5</th>
                                                <th>Q6</th>
                                                <th>Q7</th>
                                                <th>Q8</th>
                                                <th>Q9</th>
                                                <th>Q10</th>
                                                <th>Q11</th>
                                                <th>Q12</th>
                                                <th>Q13</th>
                                                <th>Q14</th>
                                                <th>Q15</th>
                                                <th>Q16</th>
                                                <th>Q17</th>
                                                <th>Q18</th>
                                                <th>Q19</th>
                                                <th>Q20</th>                                               
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>answerId</th>
                                            	<th>surveyId</th>
                                                <th>Name</th>
                                                <th>Q1</th>
                                                <th>Q2</th>
                                                <th>Q3</th>
                                                <th>Q4</th>
                                                <th>Q5</th>
                                                <th>Q6</th>
                                                <th>Q7</th>
                                                <th>Q8</th>
                                                <th>Q9</th>
                                                <th>Q10</th>
                                                <th>Q11</th>
                                                <th>Q12</th>
                                                <th>Q13</th>
                                                <th>Q14</th>
                                                <th>Q15</th>
                                                <th>Q16</th>
                                                <th>Q17</th>
                                                <th>Q18</th>
                                                <th>Q19</th>
                                                <th>Q20</th>                                               
                                            </tr>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        	 <tr>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>Parkmunsu</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>3</td>
                                                <td>1</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>Parkmd</td>
                                                <td>3</td>
                                                <td>3</td>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>3</td>
                                                <td>1</td>
                                            </tr>
                                             <tr>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>kim</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>1</td>
                                                <td>5</td>
                                                <td>2</td>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>3</td>
                                                <td>1</td>
                                            </tr>
                                              <tr>
                                                <td>4</td>
                                                <td>1</td>
                                                <td>Parkmnusu</td>
                                                <td>5</td>
                                                <td>3</td>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>3</td>
                                                <td>1</td>
                                            </tr>
                                              <tr>
                                                <td>5</td>
                                                <td>1</td>
                                                <td>Parkmnusu</td>
                                                <td>5</td>
                                                <td>3</td>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td>2</td>
                                                <td>1</td>
                                                <td>1</td>
                                                <td>3</td>
                                                <td>1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                  
  
                    
                </main>
                
            </div>
        </div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
		<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
		<script
		src="${pageContext.request.contextPath}/resources/assets/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/demo/chart-bar-demo.js"></script> 
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/demo/datatables-demo.js"></script>


</body>
</html>