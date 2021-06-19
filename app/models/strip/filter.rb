class Strip::Filter
	def filter(scope, query_params)
		if query_params[:text].present?
			scope = scope.where("title LIKE :text OR description LIKE :text OR keywords LIKE :text", text: "%#{query_params[:text]}%")
		end
		scope
	end
end