holeUser();

holeCam();

function holeUser() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);

    fetch("https://796765-3.web.fhgr.ch/php/holeUser.php",
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

            document.querySelector("#username").innerHTML = data[0].name;

        })
}

function holeCam() {


    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);

    fetch("https://796765-3.web.fhgr.ch/php/holeCam.php",
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

            camAnzeigen(data);

        })

}

function camAnzeigen(data) {

    data.forEach(cam => {


        if (parseInt(cam.status)) {

            cam.status = '✅';

        } else {

            cam.status = "❌"

        }


        let camContainer = document.createElement("div");
        camContainer.innerHTML =

            '<div class="cam">' +
            '<h2>' + cam.status + ' ' + cam.title + '</h2>' +
            '<img class="cam-image" src="' + cam.picture + '">' +
            '<p>' + cam.description + '</p>' +
            '🤑 <a target="_blank" href="mailto:' + cam.email + '">' + cam.email + '</a>' +
            '<p> <b> <span id="Cam-' + cam.ID + '">  </span> <b> </p>'
            + '</div>';

        document.getElementById("liste-cam").appendChild(camContainer);

        camContainer.classList.add("grid");

    });

}

function logout() {

    localStorage.clear();
    window.location = "/login.html";

}