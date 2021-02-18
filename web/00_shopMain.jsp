<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/js/splide.min.js"></script>

</head>

<body>

<div class="splide">
    <div class="splide__track">
        <ul class="splide__list">
            <li class="splide__slide"><img src="img/main_content1.png" alt="1" style="width: inherit"></li>
            <li class="splide__slide"><img src="img/main_content2.png" alt="2" style="width: inherit"></li>
            <li class="splide__slide"><img src="img/main_content3.png" alt="3" style="width: inherit"></li>
            <li class="splide__slide"><img src="img/main_content4.png" alt="4" style="width: inherit"></li>
        </ul>
    </div>
</div>

</body>

<script>
    new Splide( '.splide' ).mount();
</script>

</html>