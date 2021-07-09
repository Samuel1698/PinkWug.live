class Strip::Filter
	def filter(scope, query_params)
		if query_params[:text].present?
			list = File.read("#{::Rails.root}/app/models/strip/stop-words.txt").split.join('|')
			stopWords = /\b(?:#{list})\b/i
			words = query_params[:text].downcase.strip.gsub(stopWords, '').split.uniq
			if words.any?
				scope = scope.where("title ~* :text OR description ~* :text OR keywords ~* :text OR transcript ~* :text", text: words.join('|'))
			end
		end
		scope
	end
end

# words = sampleString.downcase.strip.gsub(stopWords, '').split.uniq