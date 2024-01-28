// Execute when DOM is fully loaded
$(function () {

	// set height of sidebar header to match topbar
	$("#sidebar .navbar-header").css("height", $("#topbar").css("height"));
	
	// detect resize of window
	$(window).resize(function () {
		var width = $(window).width();

		// toggle sidebar on resize
		if (width < 752) {
			hide_sidebar();
		}
		else {
			show_sidebar();
		}

		// set height of sidebar header to match topbar
		$("#sidebar .navbar-header").css("height", $("#topbar").css("height"));
	});

	// toggle sidebar on click
	$("#topbar-toggler").click(toggle_sidebar);
});

function toggle_sidebar() {
	var display = $("#sidebar").css("display");

	if (display === "none") {
		show_sidebar();
	}
	else {
		hide_sidebar();
	}
}

/* Show sidebar */
function show_sidebar() {
	$("#sidebar").css("display", "flex");
	$(".wrapper").css("display", "grid");
	$(".wrapper").css("grid-template-columns", "270px 1fr");
	$(".wrapper").css("grid-template-areas", "'sidebar main'");
}

/* Hide sidebar */
function hide_sidebar() {
	$("#sidebar").css("display", "none");
	$(".wrapper").css("display", "unset");
	$(".wrapper").css("grid-template-columns", "none");
	$(".wrapper").css("grid-template-areas", "'main'");
}


function logout() {
    window.location.href = '../login/login.html';
}
