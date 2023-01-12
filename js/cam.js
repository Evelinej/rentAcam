var camID;

holeUserCam();

function neueCam() {

    console.log("Neue Cam erstellen!");

    let titel = document.querySelector("#titel").value;
    let bild = document.querySelector("#bild").value;
    let beschreibung = document.querySelector("#beschreibung").value;
    let stadt = document.querySelector("#stadt").value;
    let status = document.querySelector("input[name='status']:checked").value;


    let formData = new FormData();
    formData.append('titel', titel);
    formData.append('bild', bild);
    formData.append('beschreibung', beschreibung);
    formData.append('stadt', stadt);
    formData.append('status', status);

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    formData.append('user', userID);

    fetch("https://796765-3.web.fhgr.ch/php/neueCam.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((response) => {

            return response.text();

        })
        .then((data) => {

            document.querySelector('#nachricht').innerHTML = data;

        })

};

function holeUserCam() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);

    fetch("https://796765-3.web.fhgr.ch/php/holeUserCam.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            if (res.status >= 200 && res.status < 300) {

                return res.json();

            } else {

                alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "/login.html"

            }

        })
        .then((data) => {

            console.log(data);

            if (data.length == 0) {

                document.querySelector('#infoText').innerHTML = "Fülle dieses Formular aus, um deine Cam aufzuschalten:"

                document.querySelector('#button-neue').classList.remove("hidden");

            } else {

                camID = data[0].id;

                document.querySelector('#infoText').innerHTML = "Hier kannst du deine Cam bearbeiten:"

                document.querySelector('#button-aktualisieren').classList.remove("hidden");
                document.querySelector('#button-loeschen').classList.remove("hidden");

                document.querySelector('#titel').value = data[0].title;
                document.querySelector('#beschreibung').value = data[0].description;
                document.querySelector('#stadt').value = data[0].city;
                document.querySelector('#bild').value = data[0].picture;
                document.querySelector('#bild-vorschau').src = data[0].picture;

                if (data[0].status == 1) {

                    document.querySelector('#status-frei').checked = true;

                } else {

                    document.querySelector('#status-besetzt').checked = true;

                }

            }
        })
}

function aktualisiereCam() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let titel = document.querySelector('#titel').value;
    let beschreibung = document.querySelector('#beschreibung').value;
    let stadt = document.querySelector('#stadt').value;
    let bild = document.querySelector('#bild').value;
    let status = document.querySelector('input[name="status"]:checked').value;

    let formData = new FormData();
    formData.append('userID', userID);
    formData.append('titel', titel);
    formData.append('beschreibung', beschreibung);
    formData.append('stadt', stadt);
    formData.append('status', status);
    formData.append('bild', bild);

    formData.append('camID', camID);

    fetch("https://796765-3.web.fhgr.ch/php/aktualisiereCam.php",
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

            document.querySelector('#nachricht').innerHTML = data;

        })
}

function loescheCam() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);
    formData.append('camID', camID);

    fetch("https://796765-3.web.fhgr.ch/php/loescheCam.php",
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

            console.log(data);

            document.querySelector('#nachricht').innerHTML = data;

            document.querySelector('#button-neue').classList.remove("hidden");
            document.querySelector('#button-aktualisieren').classList.add("hidden");
            document.querySelector('#button-loeschen').classList.add("hidden");

            document.querySelector('#titel').value = "";
            document.querySelector('#beschreibung').value = "";
            document.querySelector('#stadt').value = "";
            document.querySelector('#bild').value = "";
            document.querySelector('#status-frei').checked = false;
            document.querySelector('#status-besetzt').checked = false;

            document.querySelector('#bild-vorschau').src = "";

            camID = "";

        })
};

function logout() {

    localStorage.clear();
    window.location = "/login.html";

};