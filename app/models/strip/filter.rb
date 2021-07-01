class Strip::Filter
	def filter(scope, query_params)
		# if query_params[:text].present?
		list = File.read("#{::Rails.root}/app/models/strip/stop-words.txt").split.join('|')
		stopWords = /\b(?:#{list})\b/i
		words = query_params[:text].downcase.strip.gsub(stopWords, '').split.uniq
		# If the array is empty after excluding all the stop words
		if !words.any?
			scope = scope.where("title LIKE ?", ' ') # Returnn nothing. Must be a better way than doing a query
		else
			scope = scope.where("title REGEXP :text OR description REGEXP :text OR keywords REGEXP :text OR transcript REGEXP :text", text: words.join('|'))
		end
		# end
		# scope
	end
end

# words = sampleString.downcase.strip.gsub(stopWords, '').split.uniq