//const url = "http://localhost:3051/";
//const url = "https://multicreativa.herokuapp.com/";
const url = "http://167.99.154.234:3051/";

async function getCostos() {
  return fetch(`${url}costos`).then(res => res.json());
  //.then(res => res.data);
}
async function UpdateCostos(formData) {
  //console.log("api " + formData.nombre);
  //var myHeaders = new Headers();
  var myInit = {
    method: "PUT",
    headers: {
      "Content-Type": "application/json"
      // 'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: formData
  };
  let promise = await fetch(`${url}costos`, myInit).then(res => res.json());
  return promise;
  //.then(res => res.data);
}
export default {
  getCostos,
  UpdateCostos
};
