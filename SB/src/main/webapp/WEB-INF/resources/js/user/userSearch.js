$(document).ready(function() {
	$('#search').on('input', function() {
		const search = $(this).val();
		if (search.length > 0) {
			$.ajax({
				url: '/userSearch',
				method: 'get',
				data: { search: search },
				success: function(response) {
					displaySuggestions(response);
				},
				error: function(err) {
					console.log("錯了白痴" + err);
				}
			})
		} else {
			$('#searchSuggestions').empty();
		}
	});

	function displaySuggestions(suggestions) {
		const suggestionsContainer = $('#searchSuggestions');
		suggestionsContainer.empty();
		suggestions.forEach(function(suggestion) {
			const container = $('<div>').addClass('container');
			const row = $('<div>').addClass('row');

			const imgDiv = $('<div>').addClass('col-4');
			const img = $('<img>')
				.addClass('img-fluid img-cover')
				.attr("src", "/localimages/" + suggestion.avatar);


			const suggestionItem = $('<div>').addClass('suggestion-item col-8');
			const title = $('<div>').text(suggestion.userChineseName).addClass('suggestion-title');
			const description = $('<div>').text(suggestion.userEnglishName).addClass('suggestion-description');
			console.log(suggestion.gDescription);
			suggestionItem.append(title).append(description);
			suggestionItem.on('click', function() {
				const userNo = suggestion.userNo;
				console.log(userNo);
				window.location.href = '/setOtherUserNo/' + userNo;
			});

			imgDiv.append(img);
			row.append(imgDiv).append(suggestionItem);
			container.append(row);

			suggestionsContainer.append(container);
		});
	}

})