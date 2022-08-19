<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<c:url var="uploadJs" value="/js/upload-image.js" />
<script src="${uploadJs}"></script>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        .page-container {
            background-color: white;
            padding-right: 15px;
            width: 100%;
        }

        /*input[type=text], input [type=text] {*/
        /*    width: 100%;*/
        /*    padding: 15px;*/
        /*    margin: 5px 0 15px 0;*/
        /*    display: inline-block;*/
        /*    border: none;*/
        /*    background: #f1f1f1;*/
        /*}*/

        /*input[type=text], input [type=text] {*/
        /*    width: 100%;*/
        /*    padding: 15px;*/
        /*    margin: 5px 0 15px 0;*/
        /*    display: inline-block;*/
        /*    border: none;*/
        /*    background: #f1f1f1;*/
        /*}*/

        /*input[type=number], input [type=number] {*/
        /*    width: 100%;*/
        /*    padding: 15px;*/
        /*    margin: 5px 0 15px 0;*/
        /*    display: inline-block;*/
        /*    border: none;*/
        /*    background: #f1f1f1;*/
        /*}*/

        .textbox {
            width: 100%;
            height: 150px;
            padding: 15px 20px;
            box-sizing: border-box;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        /*input[type=text], input [type=text] {*/
        /*    width: 100%;*/
        /*    padding: 15px;*/
        /*    margin: 5px 0 15px 0;*/
        /*    display: inline-block;*/
        /*    border: none;*/
        /*    background: #f1f1f1;*/
        /*}*/

        /*input[type=text], input [type=text] {*/
        /*    !*width: 100%;*!*/
        /*    !*height:150px;*!*/
        /*    !*padding: 15px 20px;*!*/
        /*    !*box-sizing: border-box;*!*/
        /*    !*margin: 5px 0 15px 0;*!*/
        /*    !*display: inline-block;*!*/
        /*    !*border: none;*!*/
        /*    !*background: #f1f1f1;*!*/

        /*    background-color: #dddddd;*/
        /*    outline: none;*/
        /*}*/

        input[type=text], input [type=text] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 15px;
        }

        .registerbtn {
            background-color: #a68fff;
            color: white;
            padding: 10px 20px;
            margin: 40px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            font-size: 140%;
        }

        .registerbtn:hover {
            opacity: 1;
        }

        .formPadding {
            padding-top: 50px;
        }


        .center {
            text-align: center;
        }

    </style>
</head>

<body>

<c:url var="validationJs" value="/js/user-validation.js"/>
<script src="${validationJs}"></script>

<c:url var="formAction" value="/breweries/${breweryId}/2"/>
<form method="POST" action="${formAction}" class="formPadding">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="page-container">
        <div class="page-container">
            <h3 style="color:mediumpurple" class="center"> Add An Image For Your Brewery! </h3>


            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <c:url var="formAction" value="/upload" />
                    <div id="uploadForm" method="POST" action="${formAction}" enctype="multipart/form-data">
                        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>

                        <div class="form-group">
                            <label for="image">Image: </label>
                            <input type="file" name="image" id="image" />
                        </div>

                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>

            </select><br>
            <button id="uploadButton" type="submit" class="btn btn-block registerbtn">Add Image</button>
        </div>

    </div>
    </div>
</form>

</body>
</html>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>