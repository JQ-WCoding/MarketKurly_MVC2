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
            <li class="splide__slide"><img src="img/center_default.jpg" alt="1" style="width: inherit; height: fit-content; padding-top: 6rem"></li>
            <li class="splide__slide"><img src="img/center_default2.png" alt="2"></li>
            <li class="splide__slide"><img src="img/center_default3.png" alt="3" style="width: 821px; padding-top: 8rem"></li>
        </ul>
    </div>
</div>

</body>

<script>
    new Splide( '.splide' ).mount();
</script>

</html>