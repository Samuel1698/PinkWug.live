class Strip::Filter
	def filter(scope, query_params)
		# if query_params[:text].present?
		# 	scope = scope.where("title LIKE :text OR description LIKE :text OR keywords LIKE :text OR transcript LIKE :text", text: "%#{query_params[:text]}%")
		# end
		# scope
		if query_params[:text].present?
			# Do first word only for now
			arr = query_params[:text].split(" ")
			scope = scope.where("title LIKE :text OR description LIKE :text OR keywords LIKE :text OR transcript LIKE :text", text: "%#{arr[0]}%")
		end
		scope
	end
end