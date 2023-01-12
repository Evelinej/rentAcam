console.log("Hello Registrierung");

function registrieren() {

    console.log("funktion geladen");

    let benutzername = document.querySelector("#benutzername").value;
    let email = document.querySelector("#email").value;
    let password = document.querySelector("#password").value;

    console.log(benutzername + email + password);


    let formData = new FormData();
    formData.append('benutzername', benutzername);
    formData.append('email', email);
    formData.append('password', password);

    fetch("https://796765-3.web.fhgr.ch/php/registrieren.php",
        {
            body: formData,
            method: "post",
        })

        .then((response) => {

            return response.text();

        })
        .then((data) => {

            document.querySelector('#nachricht').innerHTML = data;

        })
}