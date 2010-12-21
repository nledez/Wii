$(function() {
	$("#checkGreenCheckbox").click(function(){
		check_green_checkbox();
	});
	$("#checkRedCheckbox").click(function(){
		check_red_checkbox();
	});
	$("#checkAllCheckbox").click(function(){
		check_all_checkbox();
	});
	$("#uncheckAllCheckbox").click(function(){
		uncheck_all_checkbox();
	});
	$("#hideUnneeded").click(function(){
		hide_unneeded();
	});
	$("#showAll").click(function(){
		show_all();
	});
});

$(document).ready(function() {
	//uncheck_all_checkbox();
	check_green_checkbox();
});

function check_green_checkbox() {
	$("table tr td.green input").each(function(index) {
		this.checked = true;
	});
}

function check_red_checkbox() {
	$("table tr td.red input").each(function(index) {
		this.checked = true;
	});
}

function check_all_checkbox() {
	$("table tr td input").each(function(index) {
		this.checked = true;
	});
}

function uncheck_all_checkbox() {
	$("table tr td input").each(function(index) {
		this.checked = false;
	});
}

function hide_unneeded() {
	$("table tr td.red, table tr td.blank").each(function(index) {
		$(this).hide("slow");
	});
}

function show_all() {
	$("table tr td").each(function(index) {
		$(this).show("slow");
	});
}