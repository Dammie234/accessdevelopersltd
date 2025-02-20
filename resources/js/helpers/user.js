import Token from './token'
import AppStorage from './appstorage'


class User{

 responseAfterLogin(res){
 	const access_token = res.data.access_token
 	if (Token.isValid(access_token)) {
 		AppStorage.store(access_token)
 	}
 }
 

  hasToken(){
  	const storeToken = localStorage.getItem('token');
  	if (storeToken) {
  		return Token.isValid(storeToken)? true : false
  	}
  	false
  }

  loggedIn(){
  	return this.hasToken()
  }

  token(){
  	if (this.loggedIn()) {
  		return localStorage.getItem('token');
  	}
  }


	id(){
	  	if (this.loggedIn()) {
	  		const payload = Token.payload(localStorage.getItem('token'));
	  		return payload.sub
	  	}
	  	return false
	  }

 
 
}

export default User = new User()