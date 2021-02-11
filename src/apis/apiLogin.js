import Cookies from "js-cookie";
//const url = "http://localhost:3051/";
//const url = "https://multicreativa.herokuapp.com/";
const url = "http://167.99.154.234:3051/";

async function getToken(formData) {
  console.log("api " + formData);
  //var myHeaders = new Headers();
  var myInit = {
    method: "POST",
    headers: {
     "Content-Type": "application/json"
      // 'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: formData
  };
  return fetch(`${url}login`, myInit).then(res => res.json());
  // console.log("promise : " + JSON.stringify(promise));
  //return promise;
  //.then(res => res.data);
}
export default {
  getToken,
  setUserLogged(token) {
    console.log("cokkie " + token);
    Cookies.set("Token", token);
  },
  getUserLogged() {
    return Cookies.get("Token");
  },
  deleteUserLogged() {
    Cookies.remove("Token");
  }
};
