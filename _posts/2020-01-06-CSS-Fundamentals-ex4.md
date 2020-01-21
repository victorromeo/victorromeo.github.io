---
layout: none
title: "CSS Fundamentals 4"
date: 2020-01-06
hidden: true
---
<html>
<head></head>
<body>
    <style>
        span div {
            color: purple;
        }
    </style>

    <span>
        <h2>Not effected Heading</h2>
        <div>effected text</div>
        <div>effected text</div>
        <span>not effected text</span>
        <span>
            <h2>Another not effected heading</h2>
            <div>more effected text</div>
        </span>
    </span>
</body>
</html>