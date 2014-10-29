// CREATE GROUP DROP DOWN SELECTION
function groupDropDown(){
	$.ajax({
		url: "./group.json",
		success: function(data) {
			var div = $( "#GroupDropDown")
			var form = div.children()[0]
			$(form).attr("id", "groupDropdownSelect")
			var select = document.createElement("select")
			$(select).attr("name", "group_id")
			form.appendChild(select)   
			for(i=0; i<data.length; i++){
				var option = document.createElement("option")
				$(option).attr("value", data[i]["id"])
				option.innerText = data[i]["name"]
				select.appendChild(option)
			}
			var button = document.createElement("button")
			$(button).attr({"type": "submit", "class": "startGame"})
			button.innerText = "Play!"
			form.appendChild(button)
			$('#groupDropdownSelect').on('submit', function(e){
				e.preventDefault();
				// $.ajax({
				// 	type: "POST",
				// 	url: "./game",
				// 	data: $(this).serialize(),
				// 	success: function(data) {
				// 		console.log(data);
				$("#newGame").removeClass("hide")
				gameParams(e.currentTarget[2].value)

				showMembers(e.currentTarget[2].value)

			});
		} 
	})
}

//SHOW MEMBERS OF SELECTED GROUP

function showMembers(id) {

	$.ajax({
		url: "/group/" + id,
		fail: console.log("NO"),
		success: function(data) {
			console.log(data)
			$(".groupEdit").removeClass("hide")
			for(i=0; i<data.length; i++){
				var li = document.createElement("li")
				li.innerText = data[i].name
				$("#members").append(li)
			}
		}
	})
}
//CREATE A NEW GROUP

function newGroup(){
	var div = $( "#newGroup")
	var form = div.children()[0]
	$(form).attr("id", "newGroupSelect")
	var input = document.createElement("input")

	$(input).attr({"type": "hidden", "name": "group_id", "value":"new"})
	var div = $("#newGroup")[0].children[0]

	div.appendChild(input)
	var button = document.createElement("button")

	$(button).attr("id", "newGroupButton")
	button.innerText = "Create a group"

	div.appendChild(button)
	$('#newGroupSelect').on('submit', function(e){
		e.preventDefault();

		addInput()
	})
}

function addInput() {

	var name = document.createElement("input")
	$(name).attr({"name": "name", "placeholder": "Group name"})
	var form = $('#newMemberList')[0].children[0]
	$(form).append(name)

	for(i=0; i<8; i++){
		var form = $('#newMemberList')[0].children[0]


		var input = document.createElement("input")
		$(input).attr({"name": "email" + i, "placeholder": "email"})
		$(form).append(input)
	}
	var button = document.createElement("button")
	$(button).attr({"id": "newGroupSubmitButton", "class": "newGroup"})
	button.innerText = "Create a group"
	$(form).append(button)
	$('#newGroupSubmitButton').on('submit', function(e){
		$.ajax({
			type: "POST",
			url: "./group",
			data: $(this).serialize(),
			success: function(data) {
				console.log(data)
			}
		});

	})
}



// END NEW GROUP 

// GAME PARAMS
function gameParams(group_id) {

	var form = $("#newGame")[0].children[0]
	var group = document.createElement("input")
	var name = document.createElement("input")
	var max_score = document.createElement("input")
	$(group).attr({"name": "group_id", "value": group_id, "type": "hidden"})
	$(name).attr({"name": "name", "placeholder": "Game name"})
	$(max_score).attr({"name": "max_score", "placeholder": "score to win"})
	$(form).append(group)
	$(form).append(name)
	$(form).append(max_score)
	var button = document.createElement("button")
	$(button).attr({"id": "startGame", "type": "submit"})
	button.innerText = "Let's play the feud!"
	$(form).append(button)
	$('#startGame').on('submit', function(e){
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "./game",
			data: $(this).serialize(),
			success: function(data) {
				console.log("game started")
			}
		});

	})
}

// END GAME PARAMS


//TOGGLE EDIT USER 

function showEditUser() {
	$("#showEditUser").click(function(){
		$("#editUser").toggleClass("hide")
	})
}






function hideDash() {
	$(".startGame").click(function(){
		console.log("CLICK")
		$(".dashboard").addClass("hide")
	} );
};

function scoreboard() {
	var group_id = $("#session")[0].innerText.split('/')[0]
	var groupUrl = "./group/" + group_id + ".json"
	$.ajax({
		type: "GET",
		url: groupUrl,
		success: function(data) {
			for(i=0; i<data.length; i++){
				var max = $("#session")[0].innerText.split('/')[2]
				if (data[i].score >= max) {
					
					$("#game")[0].innerHTML = "<h1>" + data[i].name + " wins!</h1>"
					var div = $( "#endgame")
					var form = div.children()[0]
					var button = document.createElement("button")
					$(button).attr({"type": "submit", "class": "endGame"})
					button.innerText = "Let's go to the bar!"
					form.appendChild(button)
				}
			}
			for(i=0; i<data.length; i++){
				var li = document.createElement("li")

				var name = data[i].name
				var score = data[i].score
				var user = data[i].id
				var par = document.createElement("p")
				par.innerText = score
				$(par).attr("style", "display: inline-block")
				$(li).attr("id", user)
				li.innerText = name + " has a score of "
				$(li).append(par)
				var up = document.createElement("span")
				$(up).attr({"class": "glyphicon glyphicon-arrow-up"})
				var down = document.createElement("span")
				$(down).attr({"class": "glyphicon glyphicon-arrow-down"})
				$("#scores").append(li)
				$(up).click(function(data){
					var userUrl = "./user/" + data.currentTarget.parentElement.id
					$.ajax({
						type: "PUT",
						data: {score: parseInt(data.currentTarget.parentElement.firstElementChild.innerText) + 1},
						url: userUrl,
						success: function(newdata){
							$("#scores")[0].innerHTML = ""
							scoreboard()
						}
					})
				})
				$(down).click(function(data){
					var userUrl = "./user/" + data.currentTarget.parentElement.id
					$.ajax({
						type: "PUT",
						data: {score: parseInt(data.currentTarget.parentElement.firstElementChild.innerText) - 1},
						url: userUrl,
						success: function(newdata){
							$("#scores")[0].innerHTML = ""
							scoreboard()
						}
					})
				})
				li.appendChild(up)
				li.appendChild(down)
			}
		}
	})
}

$(window).load(groupDropDown)
$(window).load(showEditUser)
$(window).load(newGroup)

function rollDice() {
	$("#nextTurn").click(function() {
		$("#rolls")[0].innerHTML = ""
		rollResults()
	})
}

function rollResults(){
	var die1 = document.createElement("li")
	die1Val = Math.floor(Math.random() * 6) + 1
	die1.innerText = "die one is " + die1Val
	var die2 = document.createElement("li")
	die2Val = Math.floor(Math.random() * 6) + 1
	die2.innerText = "die two is " + die2Val
	$("#rolls").append(die1)
	$("#rolls").append(die2)
	var total = die1Val + die2Val
	
	$("#rollTotal")[0].innerText = "dice total is " + total
}


//var group_id = $("#session")[0].innerText.split('/')[0]
//var game_id = $("#session")[0].innerText.split('/')[1]


$(document).ready(function(){
	scoreboard();
	rollDice();
});
