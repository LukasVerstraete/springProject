<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="New player"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            
            <form:form commandName="player" method="POST" action="create.htm">
                <p class="form-group">
                    <label class="control-label" for="username">Username:</label>
                    <form:input id="username" path="username"/>
                    <form:errors path="username"/>
                </p>
                <p class="form-group">
                    <label class="control-label" for="name">Name:</label>
                    <form:input id="name" path="name"/>
                    <form:errors path="name"/>
                </p>
                <p class="form-group">
                    <label class="control-label" for="family-name">Family name:</label>
                    <form:input id="family-name" path="familyName"/>
                    <form:errors path="familyName" element="span"/>
                </p>
                <p>
                    <label for="save" class="glyphicon glyphicon-floppy-disk"></label>
                    <input id="save" type="submit" value="save"/>
                </p>
            </form:form>
            
            <!--<form method="POST" action="<c:url value="/players/create.htm"/>" role="form">
                <p class="form-group">
                    <label class="control-label" for="username">Username:</label>
                    <input id="username" type="text" autocomplete="on" name="username" value="${player.username}" placeholder="Username"/>
                </p>
                <p class="form-group">
                    <label class="control-label" for="name">Name:</label>
                    <input id="name" type="text" autocomplete="on" name="name" value="${player.name}" placeholder="Name"/>
                </p>
                <p class="form-group">
                    <label class="control-label" for="family-name">Family name:</label>
                    <input id="family-name" type="text" autocomplete="on" name="familyName" value="${player.familyName}" placeholder="Family name"/>
                </p>
                <p>
                    <label for="save" class="glyphicon glyphicon-floppy-disk"></label>
                    <input id="save" type="submit" value="save"/>
                </p>
            </form>-->
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
