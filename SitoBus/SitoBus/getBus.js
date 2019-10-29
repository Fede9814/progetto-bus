import axios from '/axios';
function getBus() {
    axios.get('http://192.168.43.131:3000/getBus')
        .then(function(response) {
            console.log("ciao");
            console.log(response);
            return response;
        })
        .catch(function(error) {
            console.log(error);
        });
}
