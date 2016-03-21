<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Players"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
                <table>
                    <c:forEach var="player" items="${players}">
                        <tr>
                            <td><c:out value="${player}"/></td>
                        </tr>
                    </c:forEach>
                </table>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
