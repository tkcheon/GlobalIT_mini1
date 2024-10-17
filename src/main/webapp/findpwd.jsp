<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Find Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h4>Find Your Password</h4>
                    </div>
                    <div class="card-body">
                        <form action="find-password.do" method="post">
                            <div class="form-group">
                                <label for="m_id">ID</label>
                                <input type="text" class="form-control" id="m_id" name="m_id" required>
                            </div>
                            <div class="form-group">
                                <label for="m_email">Email</label>
                                <input type="email" class="form-control" id="m_email" name="m_email" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Find Password</button>
                        </form>
                        <%
                            String error = request.getParameter("error");
                            if (error != null) {
                                out.println("<div class='alert alert-danger mt-3'>" + error + "</div>");
                            }
                            String message = request.getParameter("message");
                            if (message != null) {
                                out.println("<div class='alert alert-success mt-3'>" + message + "</div>");
                            }
                        %>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>