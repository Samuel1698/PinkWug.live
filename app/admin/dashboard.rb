ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
    columns do 
      column do 
        div do 
          br
          text_node %{<iframe src="https://rpm.newrelic.com/public/charts/6VooNO2hKWB"      width="500" height="300" scrolling="no" frameborder="no"></iframe>}.html_safe
        end
      end
      column do
        panel "ActiveAdmin Demo" do
          div do
            render("/admin/sidebar_links", model: "dashboard")
          end
        end
      end
    end
    columns do
      column do 
        panel "Recent Comics" do 
          table_for Strip.all.order("id desc").limit(3) do 
            column("Comic") { |strip| image_tag url_for(strip.image.variant(resize_to_limit:[200,10000])) }
            column("Title") { |strip| strip.title }
            column("Created") { |strip| strip.created_at }
          end
        end
      end
    end
  end 
end
