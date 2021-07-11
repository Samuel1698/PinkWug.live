ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do 
      column do
        # Memory Usage
        text_node %{<iframe src="https://chart-embed.service.newrelic.com/herald/3aa18aba-87c3-45dc-ad6b-5584a2ecad29?height=300px&timepicker=true" width="330" height="330" minwidth="330" scrolling="no" frameborder="no"></iframe>}.html_safe 
      end
      column do
        # Threads
        text_node %{<iframe src="https://chart-embed.service.newrelic.com/herald/4cdf8f76-c88a-4352-a4cf-fa635d04fed1?height=300px&timepicker=true" width="330" height="330" minwidth="330" scrolling="no" frameborder="no"></iframe>}.html_safe 
      end
      column do 
        # First Input Delay
        text_node %{<iframe src="https://chart-embed.service.newrelic.com/herald/302267e8-0d10-4427-96cb-62b4bce2d559?height=300px&timepicker=true" width="330" height="330" minwidth="330" scrolling="no" frameborder="no"></iframe>}.html_safe 
      end
    end
    columns do 
      column do 
        text_node %{<iframe src="https://chart-embed.service.newrelic.com/herald/ffa81e86-5425-4f3b-83d5-259ea15cd8bb?height=400px&timepicker=true" width="990" height="430" scrolling="no" frameborder="no"></iframe>}.html_safe
      end
    end
    columns do
      column do 
        panel "Recent Comics" do 
          table_for Strip.all.order("created_at desc").limit(3) do 
            column("Comic") { |strip| image_tag url_for(strip.image.variant(resize_to_limit:[200,10000])) }
            column("Title") { |strip| strip.title }
            column("Created in") { |strip| strip.created_at }
          end
        end
      end
      column do
        panel "Contact the Developer", class: "developer_info" do
          render("/admin/sidebar_links", model: "dashboard")
        end
      end
    end
  end 
end
