wetter();

function wetter() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);

    fetch("https://796765-3.web.fhgr.ch/php/wetter.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }

        })

        .then((res) => {

            if (res.status >= 200 && res.status < 300) {

                return res.text();

            } else {

                alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "/login.html"

            }

        })
        .then((data) => {

            let wetterDaten = JSON.parse(data);
            console.log(wetterDaten);
            document.getElementById("wetter").innerHTML = wetterDaten[0];
            document.getElementById("zeit").innerHTML = wetterDaten[1];
            document.getElementById("datum").innerHTML = wetterDaten[2];
            document.getElementById("description").innerHTML = wetterDaten[3];

        })
};