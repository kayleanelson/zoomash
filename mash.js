$("div.image").click(function(){

	winner_id = $(this).find("img.subject").attr("id");

	console.log(winner_id);

	if (winner_id == "subject1") {
		var winner = image1;
		var loser = image2;

	} else {
		var winner = image2;
		var loser = image1;

	}

	// ranking via ELO System 
	//(http://stackoverflow.com/questions/164831/how-to-rank-a-million-images-with-a-crowdsourced-sort)
	rank_winner = winner.rank;
	rank_loser = loser.rank;

	kvalue = 20.0;

	win_prob_winner = 1/( Math.pow(10, (rank_loser - rank_winner)/400.0)+1.0);
	win_prob_loser = 1/( Math.pow(10, (rank_winner - rank_loser)/400.0)+1.0);

	rank_loser = rank_loser - kvalue * win_prob_loser;
	rank_winner = rank_winner + kvalue*(1.0-win_prob_winner);

	console.log(rank_winner);
	console.log(rank_loser);

	//location.reload();

});


