var xhttp = new XMLHttpRequest();
var clientId = '64cce97d9e7e42a0b336bc42307b63b7';
var clientSecret = '85338e9977f64e1eb3ef7b2256c8f213';
var body = 'Authorization: Basic <' + clientId + ':' + clientSecret + ">";

xhttp.onreadystatechange = function(){
  if(this.readyState==4 && this.status==200){
    let parsedData = JSON.parse(this.responseText);
    console.log(parsedData);
  } else {
    console.log(this.responseText);
  }
}

xhttp.open("POST","https://accounts.spotify.com/api/token",true);
xhttp.setRequestHeader('grant_type','client_credentials');
xhttp.send();
