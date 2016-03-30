<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Edit room"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <h3>Room: ${updateRoom.name}</h3>
            <form:form commandName="updateRoom" method="POST" action="update.htm">
                <p class="form-group">
                    <label class="control-label" for="games-hosted">Games hosted:</label>
                    <form:input id="games-hosted" path="gamesHosted" />
                    <form:errors path="gamesHosted" element="span"/>
                </p>
                <p>
                    <label for="save" class="glyphicon glyphicon-floppy-disk"></label>
                    <input id="save" type="submit" value="save"/>
                </p>
            </form:form>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>