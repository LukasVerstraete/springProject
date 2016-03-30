<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="<c:url value="/index.htm"/>" class="navbar-brand">Home</a>
                <a href="<c:url value="/players.htm"/>" class="navbar-brand">Players</a>
                <a href="<c:url value="/rooms.htm"/>" class="navbar-brand">Rooms</a>
            </div>
        </div>
    </nav>
</header>