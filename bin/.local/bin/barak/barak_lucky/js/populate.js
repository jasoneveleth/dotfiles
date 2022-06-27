mainHTML = '<div class="main-top" style="background-color: #0017A8;"><div id="main" class="main"><div style="font-size:36px;color:black">MySensors</div><div class="horizontalLine"></div>';

billingHTML = '<div class="main-top" style="background-color: #B10DC9;"><div id="main" class="main"><div style="font-size:36px;color:black">Billing & Data</div><div class="horizontalLine"></div>';

servicesHTML = '<div class="main-top" style="background-color:  #7FDBFF;"><div id="main" class="main"><div style="font-size:36px;color:black">Services</div><div class="horizontalLine"></div>';

codeHTML = '<div class="main-top" style="background-color: GREEN;"><div id="main" class="main"><div style="font-size:36px;color:black">Code Snippets</div><div class="horizontalLine"></div>';

contacHTML = '<div class="main-top" style="background-color: #0017A8;"><div id="main" class="main"><div style="font-size:36px;color:black">Meet The Team</div><div class="horizontalLine"></div>'


sensor_name = "Replica";

function test() {
	console.log("press the first lake button to see replication example")
	//top level sensor
	document.getElementById("main").innerHTML += '<!-----------------------sensor section----------------------------------------><div class="sensor_button" style="height:45px" onClick="test()"><div class="top_sensor">' + sensor_name + '</div><img width="40px" height="40px" src="img/gear.svg" style="margin-top:2px;margin-left:5px;"></div><div class="subhorizontalLine"></div>';

	/*for each reading_type */
	sub_reading_name = "subReplica";
	document.getElementById("main").innerHTML += '<div class="sub_sensor_button"><div class="horizontalLine"></div><div class="sub_sensor_button_mid">' + sub_reading_name + '</div><img width="40px" height="40px" src="img/gear.svg" style="margin-top:2px;margin-left:5px;"></div>';

	reading = "27.5";
	date = "2021-01-31 02:22:48.770912";


	/*for each data reading*/
	tableHTML = '<tr><td>' + reading + '</td><td>' + date + '</td></tr>';
	tableHTML += '<tr><td>' + reading + '</td><td>' + date + '</td></tr>';
	tableHTML += '<tr><td>' + reading + '</td><td>' + date + '</td></tr>';
	/*end for each data reading*/

	document.getElementById("main").innerHTML += '<div class="table-container"><table><thead><tr><th>Reading</th><th>Date</th></tr></thead><tbody>' + tableHTML;

	document.getElementById("main").innerHTML += '</tbody></table></div>';

	document.getElementById("footer").innerHTML += '<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>';

	/*end for each reading_type */
	document.getElementById("main").innerHTML += '<div class="subhorizontalLine"></div>';

}

footer = "<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>";

function loadMain() {
	document.getElementById("content-container").innerHTML = mainHTML;
	test();
	document.getElementById("footer").innerHTML = footer;
}

function loadBilling() {
	document.getElementById("content-container").innerHTML = billingHTML;
	document.getElementById("footer").innerHTML = footer;
}


function loadServices() {
	document.getElementById("content-container").innerHTML = servicesHTML;
	document.getElementById("footer").innerHTML = footer;
}

function loadCode() {
	document.getElementById("content-container").innerHTML = codeHTML;
	document.getElementById("footer").innerHTML = footer;
}

function loadContact() {
	document.getElementById("content-container").innerHTML = contacHTML;
	document.getElementById("footer").innerHTML = footer;
}

function goto(id) {
	window.location.href = "/sensor.php?id=" + id;
}


