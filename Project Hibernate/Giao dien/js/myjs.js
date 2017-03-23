function checkPass(){
	username = document.getElementById("inputUsername").value;
	//password = document.getElementById("password").value;
		if(username == "" ){
			document.getElementById("alert").style.display = "";
		}
		else{
			document.getElementById("alert").style.display = "none";;
		}
	}