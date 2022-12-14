<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<br>
<br>

<style>
    body {
        font-family: 'Roboto Slab', serif;
        font-size: 17px;
        color: #344E41;
        background-color: #DAD7CD
    }

    html {
        box-sizing: border-box;
    }

    *, *:before, *:after {
        box-sizing: inherit;
    }

    a:hover {
        color: white;
        text-decoration: underline;
    }

    .active {
        background-color: #344E41;
        color: #DAD7CD
    }

    .inactive {
        background-color: darkgray;
        opacity: 0.4;
        color: black;
    }
</style>

<div class="beer-list-section">
    <h1 style="font-family: 'Calistoga', cursive; text-align: center">Edit ${brewery.name} Beer List: </h1><br>

    <c:url var="addHref" value="/breweries/${breweryId}/addBeer"/>
    <h5>
        <c:set var="userId" value="${currentUser.id}"/>
        <c:set var="brewer" value="${brewery.brewer}"/>
        <c:if test="${userId == brewer}">
            <a class="btn btn-block" href="${addHref}">Add Beer</a>
        </c:if>
    </h5>

    <c:forEach var="beer" items="${beers}">
        <c:url var="beerHref"
               value="beer/${beer.id}/update"/>
        <h3>
            <c:choose>
                <c:when test="${beer.activityStatus}">
                    <a class="btn btn-block active" href="${beerHref}">${beer.name}</a>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-block inactive" href="${beerHref}">${beer.name}</a>
                </c:otherwise>
            </c:choose>
        </h3>
    </c:forEach>

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
