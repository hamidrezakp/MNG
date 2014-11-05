<?php
if(isset($_POST['Submit'])){
function mobile($num1,$num2,$status='num',$less=0,$big=10000){
    for($i=$less;$i<$big;$i++)
    {
        if($big>10000){die("mobile(last arg) is so much");}
        $i = (string)$i;
        $l = strlen($i);
        if($l == 1) {
            $num3 = '000' . $i;
        }
        if($l == 2) {
            $num3 = '00' . $i;
        }
        if($l == 3) {
            $num3 = '0' . $i;
        }
        if($l == 4) {
            $num3 = $i;
        }
        $num = $num1.$num2.$num3;
        if($status=='vcard'){
            echo 'BEGIN:VCARD<br/>VERSION:2.1</br/>N:;'.$num.';;;<br/>FN:'.$num.'<br/>TEL;CELL:<br/>END:VCARD<br/>';

        }else echo $num.'<br/>';

    }

}
if(isset($_POST['less']) and isset($_POST['big'])) {
    mobile($_POST['num1'], $_POST['num2'], $_POST['status'], $_POST['less'], $_POST['big']);
}else {
    mobile($_POST['num1'], $_POST['num2'], $_POST['status']);
}
}
?>
<html><head>
    <title>Mobile Number Generator</title>
</head>
<body>
    <form method="post">
        First number:<input type="number"  name="num1"><br>
        Second number:<input type="number" name="num2"><br>
        Status:Number<input type="radio" name="status" value="num">
        Vcard<input type="radio" name="status" value="vcard"><br>
        From:<input type="number" name="less">
        To:<input type="number" name="big"><br>
        <center><input type="submit" value="Submit" name="Submit"></center>
    </form>
</body>
</html>
