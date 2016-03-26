<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="New player"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <h3>Username: ${updatePlayer.username}</h3>
            <form method="POST" action="<c:url value="/players/update.htm"/>" role="form">
                <p class="form-group">
                    <label class="control-label" for="name">Name:</label>
                    <input id="name" type="text" autocomplete="on" name="name" value="${updatePlayer.name}" placeholder="Name"/>
                </p>
                <p class="form-group">
                    <label class="control-label" for="family-name">Family name:</label>
                    <input id="family-name" type="text" autocomplete="on" name="familyName" value="${updatePlayer.familyName}" placeholder="Family name"/>
                </p>
                <p>
                    <label for="save" class="glyphicon glyphicon-floppy-disk"></label>
                    <input id="save" type="submit" value="save"/>
                </p>
            </form>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>