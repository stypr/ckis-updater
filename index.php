<?php
    ignore_user_abort(1);
    date_default_timezone_set('Asia/Seoul');
    $stat = file_get_contents("build.stat");
    $stat = explode(",",$stat);
    $build_time = date("Y-m-d H:i:s", (int)$stat[1]);

    function generate_random_string($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    function download(){
        if($_SERVER['HTTP_HOST'] !== 'mil.harold.kim'){
            header("Location: https://mil.harold.kim/");
            exit;
        }
        $build = file_get_contents("build.bat");
        if(!$build) die("failed to download.");
        $build = str_replace("\n", "\r\n", mb_convert_encoding($build, "EUC-KR", "UTF-8"));
        header('Content-Description: Secure Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' .generate_random_string(). '.bat"');
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . strlen($build));
        die($build);
    }

    if($_SERVER['QUERY_STRING'] == "download"){
        if($_SERVER['HTTP_REFERER'] != 'https://mil.harold.kim/'){
            header("Location: https://mil.harold.kim");
            exit;
        }
        download();
    }
?>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, user-scalable=0">
        <meta name="description" content="Harold Kim - Yet another security enthusiast.">
        <meta name="keywords" content="stypr, Harold Kim">
        <meta name="google" content="notranslate">
        <link rel="shortcut icon" href="//harold.kim/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon-precomposed" href="//harold.kim/favicon.ico">
        <title>harold.kim &raquo; 사지방 업데이트 프로그램</title>
        <link href="//harold.kim/static/font/ubuntu.css" rel="stylesheet">
        <link href="//harold.kim/static/font/mono.css" rel="stylesheet">
        <style>
            * { padding:0; margin:0; }
            body {
                background: #333;
                font-family: 'Ubuntu Mono', sans-serif;
            }
            button,
            button::after {
              -webkit-transition: all 0.3s;
                 -moz-transition: all 0.3s;
              -o-transition: all 0.3s;
                 transition: all 0.3s;
                cursor:pointer;
            }

            button {
                background: none;
                border: 3px solid #fff;
                border-radius: 5px;
                color: #fff;
                display: block;
                font-size: 1.6em;
                font-weight: bold;
                margin: 10px auto;
                padding: 1em 2em;
                position: relative;
                text-transform: uppercase;
            }

            button::before,
            button::after {
                background: #fff;
                content: '';
                position: absolute;
                z-index: -1;
            }

            button:hover {
                color: #2ecc71;
            }

            .btn-1::after {
                height: 0;
                left: 0;
                top: 0;
                width: 100%;
            }

            .btn-1:hover:after {
                height: 100%;
            }

            pre {
                font-size: 12pt;
                letter-spacing: -1px;
                color:white;
            }
        </style>
    </head>
    <body>
        <center>
            <br><br>
            <pre>
<h2>사지방 업데이트 프로그램</h2><b>최근 업데이트 시간: <?=$build_time;?></b>

* 사지방 PC에서만 사용하세요. 일반PC용이 아닙니다!  *
우회기능과 크롬 버전은 매일 자정에 자동 업데이트 됩니다.

-------------------------------
1) 작업관리자 기능 등 불필요 기능 제거
2) YouTube, Google등 차단된 정상 사이트 우회
3) 크롬 자동 업데이트
4) 불필요한 개인정보 삭제
-------------------------------

* 알약 비즈니스 버전 영구삭제는 보안상 문제로 지웠습니다..
            </pre>
            <button class="btn-1" onclick="document.location.href='?download';">파일 다운로드</button>
            <button class="btn-1" style="font-size:14px; padding:10px 105px;" onclick="document.location.href='//github.com/stypr/ckis-updater';">소스코드</button>
    </body>
</html>
