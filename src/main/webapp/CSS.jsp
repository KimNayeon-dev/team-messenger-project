<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="shortcut icon" type="image/x-icon" href="./img/icon_mail.png">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>

<style>
	.checkI {
	    display: block;
	    position: relative;
	    padding-left: 25px;
	    margin-bottom: 12px;
	    padding-right: 15px;
	    cursor: pointer;
	    font-size: 18px;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	}
	.checkI input {
	    position: absolute;
	    opacity: 0;
	    cursor: pointer;
	}
	.checkmarkI {
	    position: absolute;
	    top: 3px;
	    left: 0;
	    height: 18px;
	    width: 18px;
	    background-color: #fff ;
	    border: 1px solid grey;
	    border-radius: 100px
	}
	.checkI input:checked ~ .checkmarkI {
	    background-color: #fff;
	}
	.checkmarkI:after {
	    content: "";
	    position: absolute;
	    display: none;
	}
	.checkI input:checked ~ .checkmarkI:after {
	    display: block;
	}
	.checkI .checkmarkI:after {
	    left: 5px;
	    top: 2px;
	    width: 6px;
	    height: 10px;
	    border: solid;
	    border-color: #f8204f;
	    border-width: 0 2px 2px 0;
	    -webkit-transform: rotate(45deg);
	    -ms-transform: rotate(45deg);
	    transform: rotate(45deg);
	}
	.cust-btn {
		margin-bottom: 10px;
		background-color: #f8204f;
		border-width: 2px;
		border-color: #f8204f;
		color: #fff;
	}
	.cust-btn:hover {
		border-color: #f8204f;
		background-color: #fff;
		color: #f8204f;
		border-radius: 20px;
		transform-style: 2s;
	}
</style>

</head>