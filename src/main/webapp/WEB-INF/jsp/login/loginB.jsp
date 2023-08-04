<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    
        <style>
                    html, body, div, span, applet, object, iframe,
            h1, h2, h3, h4, h5, h6, p, blockquote, pre,
            a, abbr, acronym, address, big, cite, code,
            del, dfn, em, img, ins, kbd, q, s, samp,
            small, strike, strong, sub, sup, tt, var,
            b, u, i, center,
            dl, dt, dd, ol, ul, li,
            fieldset, form, label, legend,
            table, caption, tbody, tfoot, thead, tr, th, td,
            article, aside, canvas, details, embed, 
            figure, figcaption, footer, header, hgroup, 
            menu, nav, output, ruby, section, summary,
            time, mark, audio, video {
                margin: 0;
                padding: 0;
                border: 0;
                font-size: 100%;
                font: inherit;
                vertical-align: baseline;
            }
            /* HTML5 display-role reset for older browsers */
            article, aside, details, figcaption, figure, 
            footer, header, hgroup, menu, nav, section {
                display: block;
            }
            body {
                line-height: 1;
            }
            ol, ul {
                list-style: none;
            }
            blockquote, q {
                quotes: none;
            }
            blockquote:before, blockquote:after,
            q:before, q:after {
                content: '';
                content: none;
            }
            table {
                border-collapse: collapse;
                border-spacing: 0;
            }
            a {color: #000; text-decoration: none; outline: none}
    
            a:hover, a:active {text-decoration: none; color:#fff; background-color:#f59000;}
    
            .container{
                width: 100vw;
                height: 100vh;
                display: flex;
                overflow: hidden;
            }
    
            .login-container{
                position: relative;
                z-index: 10000;
                width: 384px;
                background: #EEE;
                /* border: 1px solid #000; */
            }
    
            .login-container .login-box {
                position: absolute;
                /* border: 1px solid #000; */
                width: 300px;
                height: 500px;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
            }
    
            .login-text{
                font-size: 2rem;
                margin-bottom: 40px;
            }
            .id{
                margin-bottom: 20px;
            }
    
            .password{
                margin-bottom: 20px;
            }
    
    
    
            .id input, .password input{
                width: 98%;
                height: 46px;
                border-radius: 4px;
                border: 1px solid #DADADA;
                background: #fff;
            }
    
    
    
            img{
                width: calc(100% - 384px) ;
                height: 100%;
                object-fit: cover;
                /* border: 1px solid #000; */
            }
    
    
            .save-find-box{
                display: flex;
                margin-bottom: 40px;
                justify-content: space-between;
            }
    
    
            .login-button {
                margin-bottom: 20px;
            }
            .login-button button{
                width: 98%;
                height: 52px;
                border-radius: 4px;
                background: #218ECB;
                color: #fff;
                font-weight: 700;
            }
            .exit-button button{
                width: 98%;
                height: 52px;
                border-radius: 4px;
                background: #606477;
                color: #fff;
                font-weight: 700;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login-container">
                <div class="login-box">
                    <div class="login-text">로그인</div>
                    <form action="#">
                        <div class="id">
                            <input type="text" name="id" placeholder="ID" >
                        </div>
                        <div class="password" name="password">
                            <input type="password" name="password" placeholder="PW" >
                        </div>
                        <div class="save-find-box">
                            <div class="save">
                                <input type="checkbox">
                                <a href="#">아이디 저장</a>
                            </div>
                            <div class="find">
                                <a href="#">비밀번호 찾기</a>
                            </div>
                        </div>
                        <div class="login-button">
                            <button type="submit">로그인</button>
                        </div>
                        <div class="exit-button">
                            <button type="reset">나가기</button>
                        </div>
                    </form>
                    
                </div>
            </div>
            <!-- <div class="login-image-container"> -->
               <img src="/images/loginimg/loginimg1.png"/>
            <!-- </div> -->
    
        </div>
    
    </body>
    </html>