<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ProcessMaker Installation</title>
</head>
<style>
.loader {
    border: 5px solid #f3f3f3; 
    border-top: 5px solid #2E9AFE;
	border-bottom: 5px solid #2E9AFE;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
<body style="margin: 200px; background: #0e0e0e;">
    <div>
		<H1 align="center" align="bottom"><font color="2E9AFE" style="font-size:6vw;">ProcessMaker <font color="white" style="font-size:2vw;" >®</font></font></H1>
		<p align="center"><font color="white" style="font-size:1vw;">ProcessMaker is preparing to be installed, this may take a few minutes</font></p>
		<p align="center"><font color="white" style="font-size:1vw;">please wait .......</font></p>
		<br><br><br><br>
		<center>
		<div class="loader"></div>
		</center>
		<br><br><br><br><br><br>		
		<p align="center"><font color="white">For more information, see <a style="color: #2E9AFE;" href="https://www.processmaker.com">https://www.processmaker.com</a></p>
	</div>

<script>
function miFuncion()
{
    window.location.reload();
}
setInterval("miFuncion()",180000);

</script>

</body>
</html>