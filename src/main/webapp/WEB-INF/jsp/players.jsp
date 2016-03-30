<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Players"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
                <table class="table table-hover table-striped">
                    <tr>
                        <th><spring:message code="label.username"/></th>
                        <th><spring:message code="label.firstName"/></th>
                        <th><spring:message code="label.name"/></th>
                        <th></th>
                    </tr>
                    <c:forEach var="player" items="${players}">
                        <tr>
                            <td><c:out value="${player.username}"/></td>
                            <td><c:out value="${player.name}"/></td>
                            <td><c:out value="${player.familyName}"/></td>
                            <td><a href="<c:url value="/players/${player.username}.htm"/>"><span class="glyphicon glyphicon-pencil"></span></a></td>
                        </tr>
                    </c:forEach>
                </table>
                <form method="GET" action="<c:url value="/players/new.htm"/>">
                    <input type="submit" value="New" class="btn btn-primary "/>
                </form>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
