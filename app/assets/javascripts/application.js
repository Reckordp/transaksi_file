// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

(function() {
	function bukaKedok() {
		var lat;
		lat = this.getAttribute('data-posisi-latitude');
		lon = this.getAttribute('data-posisi-longitude')
		open('geo:' + lat + ',' + lon, '_blank');
	}

	function posisi_lat_lon(pos) {
		var elm;
		elm = document.createElement('a');
		elm = document.getElementById('batas');
		elm.className = "siap";
		elm.onclick = bukaKedok;
		elm.setAttribute('data-posisi-latitude', pos.coords.latitude);
		elm.setAttribute('data-posisi-longitude', pos.coords.longitude)
		// elm.target = "_blank";
		// elm.innerHTML = "Posisimu";
		// document.getElementsByTagName('body')[0].appendChild(elm);
	}
	function posisi_error(err) {
		console.warn('ERROR(' + err.code +'): ' + err.message)
	}
	function dasar() {
		navigator.geolocation.getCurrentPosition(posisi_lat_lon, posisi_error);
	}

	window.onload = dasar;
}).call(this)