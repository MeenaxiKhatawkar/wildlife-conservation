<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Dhari.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap');

        :root {
            --main: #ff6200;
            --bg: #ffffff;
            --black: #000;
            --white: #fff;
            --box-shadow: 0 .5rem 1rem rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            outline: none;
            border: none;
            text-decoration: none;
            text-transform: capitalize;
            transition: .2s linear;
        }

        html {
            font-size: 62.5%;
            overflow-x: hidden;
            scroll-behavior: smooth;
            scroll-padding-top: 4rem;
        }

            html::-webkit-scrollbar {
                width: 1rem;
            }

            html::-webkit-scrollbar-track {
                background: transparent;
            }

            html::-webkit-scrollbar-thumb {
                background: var(--main);
                border-radius: 5rem;
            }

        section {
            padding: 8rem 7%;
        }

        .heading {
            text-align: center;
            font-size: 4rem;
            color: var(--main);
            text-transform: uppercase;
            margin-bottom: 3rem;
            padding: 1.2rem 0;
        }

        .btn {
            font-size: 1.7rem;
            display: inline-block;
            background: var(--main);
            color: var(--white);
            box-shadow: var(--box-shadow);
            border-radius: 5rem;
            padding: 0.9rem 0rem;
            margin-top: 1rem;
            z-index: 0;
            position: relative;
            overflow: hidden;
        }

            .btn::before {
                content: '';
                position: absolute;
                top: 0;
                height: 100%;
                width: 0%;
                background: #ff9748;
                z-index: -1;
                transition: .3s linear;
                left: 0;
            }

            .btn:hover::before {
                width: 100%;
            }

        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: var(--white);
            box-shadow: var(--box-shadow);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 2rem 9%;
        }

            .header .logo {
                font-size: 2.5rem;
                font-weight: bolder;
                color: var(--black);
            }

                .header .logo i {
                    color: var(--main);
                }

            .header .navbar a {
                font-size: 1.7rem;
                color: var(--black);
                margin: 0 1rem;
            }

                .header .navbar a:hover {
                    color: var(--main);
                }

            .header .icons div {
                font-size: 2.5rem;
                margin-left: 1.7rem;
                cursor: pointer;
                color: var(--black);
            }

                .header .icons div:hover {
                    color: var(--main);
                }

        #menu-btn {
            display: none;
        }

        .header .main-form .login-form {
            position: absolute;
            top: 115%;
            right: -105%;
            background: var(--white);
            border-radius: .5rem;
            box-shadow: var(--box-shadow);
            width: 35rem;
            padding: 2rem;
        }

            .header .main-form .login-form.active {
                right: 3rem;
                transition: .4s linear;
            }

            .header .main-form .login-form h3 {
                font-size: 2.2rem;
                color: var(--black);
                text-transform: uppercase;
                margin-bottom: .7rem;
                text-align: center;
            }

            .header .main-form .login-form .box {
                font-size: 1.5rem;
                padding: 1rem 1.2rem;
                border: .1rem solid rgba(0, 0, 0, 0.1);
                margin: .7rem 0;
                color: var(--black);
                width: 90%;
                text-transform: none;
            }

            .header .main-form .login-form .remember {
                display: flex;
                align-items: center;
                gap: .5rem;
                margin: .7rem;
            }

                .header .main-form .login-form .remember label {
                    font-size: 1.5rem;
                    color: var(--black);
                    cursor: pointer;
                }

            .header .main-form .login-form .btn {
                width: 100%;
                text-align: center;
            }


        #toggle {
            display: none;
        }

            #toggle:checked ~ .login-form .sub-form {
                opacity: 0;
                pointer-events: none;
                top: 40%;
            }

        .header .main-form .sub-form {
            position: absolute;
            top: 115%;
            right: -125%;
            background: var(--white);
            border-radius: .5rem;
            box-shadow: var(--box-shadow);
            width: 35rem;
            padding: 2rem;
        }

            .header .main-form .sub-form.active {
                right: 4rem;
                transition: .4s linear;
            }

            .header .main-form .sub-form .content {
                margin: 20px 0;
            }

                .header .main-form .sub-form .content h3 {
                    font-size: 2.2rem;
                    color: var(--black);
                    text-transform: uppercase;
                    margin-bottom: .7rem;
                    text-align: center;
                    font-weight: 600;
                }

                .header .main-form .sub-form .content p {
                    font-size: 1.5rem;
                    color: var(--black);
                    text-transform: uppercase;
                    margin-top: 1.7rem;
                    margin-bottom: 1.7rem;
                    text-align: center;
                    margin-left: 1px;
                }

            .header .main-form .sub-form .field {
                height: 45px;
                width: 100%;
                margin-bottom: 12px;
            }

                .header .main-form .sub-form .field input {
                    width: 87%;
                    height: 100%;
                    border-radius: 2px;
                    border: .2rem solid rgba(0, 0, 0, 0.1);
                    padding: 0 15px;
                    outline: none;
                    font-size: 17px;
                    transition: all 0.3s ease;
                    text-transform: lowercase;
                }

                    .header .main-form .sub-form .field input:focus {
                        border-color: black;
                    }

            .header .main-form .sub-form .btn {
                width: 97%;
                position: relative;
                overflow: hidden;
                border-radius: 5px;
                text-align: center;
                margin-top: 60px;
            }

                .header .main-form .sub-form .btn button {
                    z-index: 1;
                    position: relative;
                    background: none;
                    padding: 0px !important;
                    color: var(--white);
                    border: 0px;
                    outline: none;
                    font-size: 20px;
                    font-weight: 500;
                    cursor: pointer;
                    height: 100%;
                    width: 100%;
                }

        .main-form .sub-form .text {
            margin-top: 5px;
            font-size: 1.25rem;
            text-align: center;
            color: var(--black);
        }

        .home {
            min-height: 100vh;
            display: flex;
            align-items: center;
            background: url(../images/gallery-1.jpg) no-repeat;
            background-size: cover;
            background-position: top;
        }

            .home .content {
                max-width: 60rem;
            }

                .home .content h3 {
                    color: var(--white);
                    font-size: 6rem;
                    line-height: 1.4;
                    font-weight: 400;
                }

            .home .wave {
                position: absolute;
                bottom: -174px;
                left: 0;
                width: 100%;
                height: 12rem;
            }


        .about .box-container {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 6rem;
        }

        .about .deco-title {
            font-size: 10rem;
            font-weight: 700;
            white-space: nowrap;
            line-height: 0.5;
            color: transparent;
            -webkit-text-fill-color: transparent;
            -webkit-text-stroke: 1px rgb(204,204,204);
            transform-origin: top left;
            transform: rotate(0.25turn);
            position: absolute;
            top: 115%;
            left: 48%;
            z-index: -1;
        }

        .about .box-container .image {
            flex: 1 1 31rem;
        }

            .about .box-container .image img {
                width: 100%;
            }

        .about .content {
            flex: 1 1 41rem;
        }

            .about .content .title {
                font-size: 4rem;
                color: var(--black);
            }

            .about .content p {
                font-size: 1.7rem;
                color: #444;
                padding: 1rem 0;
                line-height: 2;
            }

            .about .content .icons-container {
                display: flex;
                flex-wrap: wrap;
                gap: .5rem;
                margin-top: 3rem;
            }

                .about .content .icons-container .icons {
                    flex: 1 1 16rem;
                    text-align: center;
                    background: var(--bg);
                    padding: 3rem 2rem;
                }

                    .about .content .icons-container .icons .fas {
                        height: 5rem;
                        font-size: 4rem;
                        color: var(--main);
                    }

                    .about .content .icons-container .icons h3 {
                        padding: 1rem;
                        font-size: 1.5rem;
                        color: #444;
                        font-weight: normal;
                    }

        .gallery {
            background: var(--bg);
        }

        .wrapper {
            display: flex;
            max-width: 1265px;
            position: relative;
        }

            .wrapper i {
                top: 50%;
                height: 44px;
                width: 44px;
                color: #343F4F;
                cursor: pointer;
                font-size: 1.15rem;
                position: absolute;
                text-align: center;
                line-height: 44px;
                background: #fff;
                border-radius: 50%;
                transform: translateY(-50%);
                transition: transform 0.1s linear;
            }

                .wrapper i:active {
                    transform: translateY(-50%) scale(0.9);
                }

                .wrapper i:hover {
                    background: #f2f2f2;
                }

                .wrapper i:first-child {
                    left: -22px;
                    display: none;
                }

                .wrapper i:last-child {
                    right: -22px;
                }

            .wrapper .carousel {
                font-size: 0px;
                cursor: pointer;
                overflow: hidden;
                white-space: nowrap;
                scroll-behavior: smooth;
            }

        .carousel.dragging {
            cursor: grab;
            scroll-behavior: auto;
        }

            .carousel.dragging img {
                pointer-events: none;
            }

        .carousel img {
            height: 340px;
            object-fit: cover;
            user-select: none;
            margin-left: 14px;
            width: calc(100% / 3);
        }

            .carousel img:first-child {
                margin-left: 0px;
            }

        .animals .box-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(25rem, 1fr));
            gap: 2rem;
        }

            .animals .box-container .box {
                height: 100%;
                position: relative;
                overflow: hidden;
            }

                .animals .box-container .box img {
                    height: 100%;
                    width: 100%;
                    object-fit: cover;
                }

                .animals .box-container .box:hover img {
                    transform: scale(1.1);
                }

                .animals .box-container .box .content {
                    text-align: center;
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    right: 0;
                    padding: 20px;
                    z-index: 1;
                    transition: 0.5s ease;
                }

                .animals .box-container .box:hover::after {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: var(--black);
                    opacity: 0.5;
                    transition: 0.5s ease;
                }

                .animals .box-container .box .content h3 {
                    text-align: center;
                    font-size: 3rem;
                    color: var(--white);
                }

                .animals .box-container .box::is(:hover, :focus-within) .content {
                    transform: translateY(-20px);
                }


        .animals section {
            display: block;
            height: 100%;
            width: 100%;           
        }

        button {
            font-size: 18px;
            font-weight: 400;
            color: #fff;
            padding: 14px 22px;
            border: none;
            background: #4070f4;
            border-radius: 6px;
            cursor: pointer;
        }

            button:hover {
                background-color: #265df2;
            }

            button.show-modal,
            .modal-box {
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            }

        .animals section.active .show-modal {
            display: none;
        }

        .overlay {
            position: fixed;
            height: 100%;
            width: 100%;
            background: rgba(0, 0, 0, 0.3);
            opacity: 0;
            pointer-events: none;
        }

        .animals section.active .overlay {
            opacity: 1;
            pointer-events: auto;
        }


        .modal-box {
            display: flex;
            position: fixed;
            flex-direction: column;
            align-items: center;
            max-width: 380px;
            width: 100%;
            padding: 30px 20px;
            border-radius: 24px;
            background-color: #fff;
            opacity: 0;
            pointer-events: none;
            transition: all 0.3s ease;
            transform: translate(-50%, -50%) scale(1.2);
        }

        section.active .modal-box {
            opacity: 1;
            pointer-events: auto;
            transform: translate(-50%, -50%) scale(1);
        }

        .modal-box h2 {
            margin-top: 20px;
            font-size: 25px;
            font-weight: 500;
            color: var(--black);
        }

        .modal-box h3 {
            font-size: 16px;
            font-weight: 400;
            color: var(--black);
            text-align: center;
        }

        .modal-box .buttons {
            margin-top: 25px;
        }

        .animals .box-container .box .content .modal-box h3 {
            text-align: center;
            font-size: 2rem;
            color: var(--black);
        }

        .modal-box button {
            font-size: 14px;
            padding: 6px 12px;
            margin: 0 10px;
        }



        .banner {
            background: url(../images/banner.png) no-repeat;
        }

            .banner .row {
                display: flex;
                align-items: center;
                flex-wrap: wrap;
                gap: 6rem;
            }

                .banner .row .content {
                    flex: 1 1 39rem;
                }

                    .banner .row .content h3 {
                        font-size: 2rem;
                        color: var(--main);
                        text-transform: uppercase;
                    }

                    .banner .row .content p {
                        font-size: 1.6rem;
                        color: var(--black);
                        padding: 1rem 0;
                        line-height: 1.8;
                    }

                .banner .row .image {
                    flex: 1 1 41rem;
                    margin-bottom: -7rem;
                }

                    .banner .row .image img {
                        width: 100%;
                    }

       

        .contact {
            background: var(--bg);
        }

            .contact form {
                padding: 2rem 10%;
                text-align: center;
            }

                .contact form .inputBox {
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: space-between;
                }

                    .contact form .inputBox input,
                    .contact form textarea {
                        font-size: 1.7rem;
                        width: 49%;
                        padding: 1rem 2rem;
                        margin: 1rem 0;
                        border-radius: .5rem;
                        text-transform: none;
                    }

                        .contact form .inputBox input::placeholder,
                        .contact form textarea::placeholder {
                            text-transform: capitalize;
                        }

                .contact form textarea {
                    height: 15rem;
                    resize: none;
                    width: 100%;
                }

       

        .footer {
            background: url(../images/footer.jpg) no-repeat;
            background-size: cover;
            padding: 3rem 7%;
        }

            .footer .box-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(25rem, 1fr));
                gap: 1.5rem;
            }

                .footer .box-container .box h3 {
                    font-size: 2.5rem;
                    color: var(--main);
                    padding: 1rem 0;
                }

                .footer .box-container .box p {
                    font-size: 1.5rem;
                    line-height: 1.8;
                    color: var(--white);
                    padding: 1rem 0;
                }

                .footer .box-container .box .links {
                    display: block;
                    font-size: 1.5rem;
                    color: var(--white);
                    padding: 1rem 0;
                }

                    .footer .box-container .box .links i {
                        color: var(--main);
                        padding-right: .5rem;
                    }

                    .footer .box-container .box .links:hover i {
                        padding-right: 2rem;
                    }

               

                .footer .box-container .box .email {
                    width: 100%;
                    margin: .7rem 0;
                    padding: 1rem;
                    border-radius: .5rem;
                    background: var(--white);
                    font-size: 1.6rem;
                    color: var(--black);
                    text-transform: none;
                }

                .footer .box-container .box .share a {
                    height: 3rem;
                    width: 3rem;
                    line-height: 3rem;
                    color: var(--black);
                    background: var(--white);
                    font-size: 1.2rem;
                    border-radius: 5rem;
                    margin-right: .8rem;
                    text-align: center;
                    margin-top: 1.4rem;
                }

                    .footer .box-container .box .share a:hover {
                        background: var(--main);
                    }

            .footer .credit {
                font-size: 2rem;
                text-align: center;
                margin-top: 2rem;
                padding-top: 2.5rem;
                color: var(--black);
                border-top: .2rem solid rgba(0, 0, 0, 0.2);
            }

                .footer .credit .link {
                    color: var(--main);
                }

       

        @media(max-width: 991px) {
            html {
                font-size: 55%;
            }

            .header {
                padding: 2rem;
            }

            section {
                padding: 8rem 2rem;
            }
        }

        @media (max-width: 768px) {

            #menu-btn {
                display: inline-block;
            }

            .header .navbar {
                position: absolute;
                top: 99%;
                left: 0;
                right: 0;
                background: var(--white);
                border-top: .1rem solid var(--main);
                clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
            }

                .header .navbar.active {
                    clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
                }

                .header .navbar a {
                    display: block;
                    margin: 2rem;
                    font-size: 2rem;
                }

            .home {
                background-position: left;
            }

                .home .content h3 {
                    font-size: 5rem;
                }

            .deco-title {
                display: none;
            }
        }

        @media (max-width: 450px) {
            html {
                font-size: 50%;
            }

            .home .content h3 {
                font-size: 4rem;
            }
        }

        @media screen and (max-width: 900px) {
            .carousel img {
                width: calc(100% / 2);
            }
        }

        @media screen and (max-width: 550px) {
            .carousel img {
                width: 100%;
            }
        }
        #lblSub{
            color:green;
            font-size:20px;
            margin-left:25px;
            font-weight:900;
        }
    </style>
</head>
<body>
    <div>
        <header class="header">

            <a href="#" class="logo"><i class="fas fa-paw" aria-hidden="true"></i>wildlife </a>
            <nav class="navbar">
                <a href="#home">Home</a>
                <a href="#about">About</a>
                <a href="#gallery">Gallery</a>
                <a href="#animals">Animals</a>

            </nav>
            <div class="icons">
                <div id="login-btn" class="fas fa-user"></div>
                <div id="sub-btn" class="fas fa-bell"></div>
                <div id="menu-btn" class="fas fa-bars"></div>

            </div>



            <form runat="server" class="main-form">
                <div class="login-form">
                    <h3>Login Form</h3>

                    <input type="email" id="txtEmail" placeholder="Enter your email" name="email" class="box" runat="server" />
                    <input type="password" id="txtPassword" placeholder="Enter your password" class="box" runat="server" />

                    <input type="submit" id="btnSubmit" runat="server" onserverclick="btnSubmit_ServerClick" />
                </div>


                <div class="sub-form">
                    <div class="content">
                        <h3>Become a Subscriber</h3>
                        <p>Subscribe to our blog and get the latest updates straight to your inbox.</p>
                    </div>
                    <div class="field">
                        <input type="text" id="txtUserName" runat="server" class="email" name="email" placeholder="User Name" />
                        <input type="email" id="txtSubEmail" runat="server" class="email" name="email" placeholder="Email Address" />
                    </div>
                    <div class="field btn">
                        <input id="btnSuscribe" type="submit" runat="server"  onserverclick="btnSuscribe_ServerClick"/>
                    </div>
                    <label id="lblSub" runat="server"></label>
                    <div class="text">We do not share your information.</div>
                </div>

            </form>
        </header>

       
        <section class="home" id="home">
            <div class="content">
                <h3>be voice for the voiceless.</h3>
                
            </div>

            <img src="images/bottom_wave.png" alt="" class="wave" />
        </section>


        <section class="about" id="about">
            <h2 class="deco-title">About us</h2>

            <div class="box-container">
                <div class="image">
                    <img src="images/about.png" alt="" />
                </div>

                <div class="content">
                    <h3 class="title">Raising Awareness</h3>
                    <p>
                        Conservation behaviors  are considered essential actions that 
                tremendously influence ecosystems. Environmental behaviors 
                are essential to ecological conservation and to environmental 
                protection.It is important to involve the citizens in the 
                domain of the conservation of the environment and biodiversity
                 conservation. Our scientific studies revealed that the 
                 respondents reported a lower level of practices in
                  the conservation of species. Solutions have been initiated, 
                  the most important of which is to educate the inhabitants 
                  to encourage them to conserve the species. Education 
                  sessions were carried out by the author and his collaborators
                   during the two las decades with local inhabitants, students, 
                   associations and authorities. As part of their scientific
                    research, they visited most of the villages. They discuss
                     with people the ecological and economic roles of
                      biodiversity and the importance of conserving it.
                    </p>

                    <div class="icons-container">
                        <div class="icons">
                            <i class="fas fa-graduation-cap"></i>
                            <h3>we educate</h3>
                        </div>
                        <div class="icons">
                            <i class="fas fa-bullhorn"></i>
                            <h3>we play</h3>
                        </div>
                        <div class="icons">
                            <i class="fas fa-book-open"></i>
                            <h3>getting to know</h3>
                        </div>
                    </div>
                </div>

            </div>

        </section>

    
        <section class="gallery" id="gallery">

            <h2 class="heading">endangered animals</h2>

            <div class="wrapper">
                <i id="left" class="fas fa-angle-left" aria-hidden="true"></i>
                <div class="carousel">
                    <img src="extinct animal/blackrhino.jpg" alt="img" draggable="false" />
                    <img src="extinct animal/eagle.jpg" alt="img" draggable="false" />
                    <img src="extinct animal/monkey.jpg" alt="img" draggable="false" />
                    <img src="extinct animal/panda.jpeg" alt="img" draggable="false" />
                    <img src="extinct animal/red eyed frog.jpg" alt="img" draggable="false" />
                    <img src="extinct animal/sea turtle.jpg" alt="img" draggable="false" />
                    <img src="extinct animal/polar-bear.jpg" alt="img" draggable="false" />
                </div>
                <i id="right" class="fas fa-angle-right" aria-hidden="true"></i>
            </div>


        </section>

        <section class="animals" id="animals">

            <h2 class="heading">conservered animals</h2>





            <div class="box-container">

                <div class="box">
                    <img src="images/snow-leopard.jpg" alt="" />
                    <div class="content">

                        <h3>project snow leopard</h3>
                        <a href="projects/project1.html" class="btn">see details</a>


                    </div>
                </div>

                <div class="box">
                    <img src="images/tiger.jpg" alt="" />
                    <div class="content">
                        <h3>project tiger</h3>
                        <a href="projects/project2.html" class="btn">see details</a>

                    </div>
                </div>

                <div class="box">
                    <img src="images/elephant.jpg" alt="" />
                    <div class="content">
                        <h3>project elephant</h3>
                        <a href="projects/project3.html" class="btn">see details</a>

                    </div>
                </div>

                <div class="box">
                    <img src="images/crocodile.jpg" alt="invalid" />
                    <div class="content">
                        <h3>project crocodile</h3>
                        <a href="projects/project4.html" class="btn">see details</a>

                    </div>
                </div>

            </div>

        </section>


        <section class="banner">

            <div class="row">

                <div class="content">
                    <h3>sustainable wild life management</h3>
                    <p>
                        According to the Convention on Biological Diversity, sustainable
            wildlife management is the sound management of 
            wildlife species to sustain their populations
             and habitat over time, considering the socioeconomic
              needs of human populations.
                    </p>
                </div>

                <div class="image">
                    <img src="images/banner_1.png" alt="" />
                </div>

            </div>

        </section>

     

        <section class="footer">

            <div class="box-container">

                <div class="box">
                    <h3><i class="fas fa-paw"></i>Wildlife</h3>
                    <p>
                        India has been fore-running 
                    activities for the conservation of 
                    wildlife since the early 1930s with 
                    the establishment of Jim Corbett National Park.
                    </p>
                </div>

                <div class="box">
                    <h3>Contact Info</h3>
                    <a href="#" class="links"><i class="fas fa-phone"></i>1235-456-7890</a>
                    <a href="#" class="links"><i class="fas fa-envelope"></i>info@Wildlife.com</a>
                    <a href="#" class="links"><i class="fas fa-map-marker-alt"></i>dharwad, karnataka, india</a>
                </div>

                <div class="box">
                    <h3>quick links</h3>
                    <a href="#" class="links"><i class="fas fa-arrow-right"></i>home</a>
                    <a href="#" class="links"><i class="fas fa-arrow-right"></i>about</a>
                    <a href="#" class="links"><i class="fas fa-arrow-right"></i>gallery</a>
                    <a href="#" class="links"><i class="fas fa-arrow-right"></i>animal</a>

                </div>



            </div>

            <div class="credit">
                <h3>Shoutcast Hoppers</h3>
            </div>

        </section>
        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

        <script src="js/script.js"></script>
    </div>
</body>
</html>
