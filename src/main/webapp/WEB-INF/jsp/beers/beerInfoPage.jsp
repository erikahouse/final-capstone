<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Calistoga&family=Roboto+Slab&display=swap" rel="stylesheet">

<style>
    * {box-sizing: border-box;}

    body {
        font-family: 'Roboto Slab', serif;;
        font-size: 17px;
        color: #344E41;
        background-color: #DAD7CD;
    }

    .about-section {
        text-align: center;
        font-size: 20px;
        color: #f1f1f1;
        background-color: #588157;
        padding: 1em;
    }

    .review-section {
        text-align: center;
        font-size: 20px;
        color: #f1f1f1;
        background-color: #3A5A40;
        padding: 1em;
    }

    .button {
        background-color: #344E41;
        color: white;
        border: none;
        cursor: pointer;
        width: 50%;
        font-size: 100%;
        margin-bottom: 10px;
    }

    .img-center {
        width: 500px;
        height: 600px;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>

<br>
<br>
<br>
<c:url var="backToBrewery"
       value="/breweries/${brewery.id}"/>
    <h1 style="text-align: center; font-family: 'Calistoga', cursive;">Beer Information Page</h1><br>
    <c:url var="image" value="/img/uploads/${beer.image}"/>

    <img src="${image}" alt="beerPicture" class="img-center">
<br>

<div class="about-section">
<h2 style="text-align: center; font-family: 'Calistoga', cursive;">More about ${beer.name}</h2>
<a style="text-align: center; font-family: 'Calistoga', cursive; color: white;"
   href="${backToBrewery}" >from ${brewery.name}</a><br>

    <br>
<c:if test="${beer.brewer == currentUser.id}">
    <row>
        <c:url var="updateHref" value="/beer/${beerId}/update"/>
        <h5>
            <a class="btn btn-primary button" href="${updateHref}">Update Beer</a>
        </h5>

        <c:url var="deleteHref" value="/beer/${beerId}/delete"/>
        <h5>
            <a class="btn btn-primary button" href="${deleteHref}">Delete Beer</a>
        </h5>
    </row>

</c:if>

<p style="font-size: 25px;">${beer.description}</p>


<p>
<ul style="list-style: none;">
    <li>ABV: ${beer.abv}%</li>
    <li>Beer Type: ${beer.beerType}</li>
    <br>
</ul>
</p>
</div>
<br>
<div class="review-section">
    <br>
<h1 style="text-align: center; font-family: 'Calistoga', cursive;">${beer.name} Reviews</h1>

<c:choose>
    <c:when test="${averageRating > 0}">
        <h4>Average Rating: ${averageRating} out of 5!</h4>

        <hr>

        <c:forEach var="review" items="${reviews}">

            <h4>${review.getReviewTitle()} <small>by: ${review.getUsername()}</small></h4>

            <c:set var="rating" value="${review.getRating()}"/>
            <c:url var="beermugurl" value="/img/newbeers.png"/>
            <c:forEach begin="1" end="${rating}">
                <a> <img class="ratingStar" src="${beermugurl}"/></a>
            </c:forEach>

            <p>${review.getReview()}</p>

            <c:forEach var="image" items="${review.getReviewImages()}">
                <c:url var="img" value="/img/uploads/${image}"/>
                <a><img src="${img}" style="width: 200px; height: 200px;"/></a>
            </c:forEach>

<%--            <c:forEach var="response" items="${review.getReviewResponses()}">
                <h4>Response from Brewer: ${response}</h4>
            </c:forEach> --%>

            <c:if test="${currentUser.getUserName() == review.getUsername()}">
                <c:url var="addImage" value="/beer/${beerId}/review/${review.getId()}/reviewImages"/>
                <h5>
                    <a class="btn btn-primary button" href="${addImage}">Add Image to Your Review</a>
                </h5>
            </c:if>
<%---
            <c:if test="${beer.brewer == currentUser.id}">

                <br><input type="text" id="response" name="response" placeholder="Respond to Review">
                <c:url var="submitResponse" value="/beer/${beerId}/review/${review.getId()}/response"/>
                <a class="btn btn-primary button" href="${submitResponse}">Submit</a>

            </c:if>
--%>
            <br><br>
            <hr style="color: #3A5A40">
        </c:forEach>

    </c:when>
    <c:otherwise>
        <hr>
        <h4>There has not been a review for this beer yet! :(</h4>
    </c:otherwise>
</c:choose>

<c:if test="${currentUser.role.equals('beerLover')}">
    <c:url var="newReviewHref"
           value="/beer/${beerId}/reviews/new"/>
    <h3>
        <a class="btn btn-primary" href="${newReviewHref}">Write a Review</a> </h3>
</c:if>

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>

