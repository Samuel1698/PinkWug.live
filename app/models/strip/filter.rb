class Strip::Filter
	def filter(scope, query_params)
		# if query_params[:text].present?
		# 	scope = scope.where("title LIKE :text OR description LIKE :text OR keywords LIKE :text OR transcript LIKE :text", text: "%#{query_params[:text]}%")
		# end
		# scope
		if query_params[:text].present?
			list = File.read("#{::Rails.root}/app/models/strip/stop-words.txt").split.join('|')
			stopWords = /\b(?:#{list})\b/i
			words = query_params[:text].downcase.strip.gsub(stopWords, '').split.uniq
			scope = scope.where("title REGEXP :text OR description REGEXP :text OR keywords REGEXP :text OR transcript REGEXP :text", text: words.join('|'))
		end
		scope
	end
end