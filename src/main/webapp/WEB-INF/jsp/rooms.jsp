<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Rooms"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
                <table class="table table-hover table-striped">
                    <tr>
                        <th>Room name</th>
                        <th>Games hosted</th>
                        <th></th>
                    </tr>
                    <c:forEach var="room" items="${rooms}">
                        <tr>
                            <td><c:out value="${room.name}"/></td>
                            <td><c:out value="${room.gamesHosted}"/></td>
                            <td><a href="<c:url value="/rooms/${room.name}.htm"/>"><span class="glyphicon glyphicon-pencil"></span></a></td>
                        </tr>
                    </c:forEach>
                </table>
                <form method="GET" action="<c:url value="/rooms/new.htm"/>">
                    <input type="submit" value="New" class="btn btn-primary "/>
                </form>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
