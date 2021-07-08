ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do 
      column do
        # Memory Usage
        text_node %{<iframe src="https://chart-embed.service.newrelic.com/herald/89fad722-cb39-4528-861e-6464d95db9ed?height=300px&timepicker=false" width="330" height="330" scrolling="no" frameborder="no"></iframe>}.html_safe 
      end
      column do
        # Threads
        text_node %{<iframe src="https://chart-embed.service.newrelic.com/herald/0e8fd7cc-4f7f-49d7-b5cc-155664809252?height=300px&timepicker=false" width="330" height="330" scrolling="no" frameborder="no"></iframe>}.html_safe 
      end
      column do 
        # First Input Delay
        text_node %{<iframe src="https://chart-embed.service.newrelic.com/herald/8ff22f4a-4406-43c1-ac05-c31a8779d569?height=300px&timepicker=false" width="330" height="330" scrolling="no" frameborder="no"></iframe>}.html_safe 
      end
    end
    columns do 
      column do 
        text_node %{<iframe src="https://chart-embed.service.newrelic.com/herald/a621a408-b9d5-43b9-b05c-e85f83e2d24a?height=400px&timepicker=true" width="990" height="430" scrolling="no" frameborder="no"></iframe>}.html_safe
      end
    end
    columns do
      column do 
        panel "Recent Comics" do 
          table_for Strip.all.order("id desc").limit(3) do 
            column("Comic") { |strip| image_tag url_for(strip.image.variant(resize_to_limit:[200,10000])) }
            column("Title") { |strip| strip.title }
            column("Created in") { |strip| strip.created_at }
          end
        end
      end
      column do
        panel "Contact the Developer" do
          div do
            render("/admin/sidebar_links", model: "dashboard")
          end
        end
      end
    end
  end 
end
