<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <title></title>
  <meta name="Generator" content="Cocoa HTML Writer">
  <meta name="CocoaVersion" content="1187.39">
  <style type="text/css">
    p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px 'Helvetica Neue'; color: #323333}
  </style>
</head>
<body>
<p class="p1">function CheckPassword(inputtxt)   </p>
<p class="p1">{   </p>
<p class="p1">var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&amp;*])[a-zA-Z0-9!@#$%^&amp;*]{7,12}$/;  </p>
<p class="p1">if(inputtxt.value.match(paswd))   </p>
<p class="p1">{   </p>
<p class="p1">alert('Correct, try another...')  </p>
<p class="p1">return true;  </p>
<p class="p1">}  </p>
<p class="p1">else  </p>
<p class="p1">{   </p>
<p class="p1">alert('Wrong...!')  </p>
<p class="p1">return false;  </p>
<p class="p1">}  </p>
<p class="p1">}    </p>
<p class="p1">     </p>
</body>
</html>
