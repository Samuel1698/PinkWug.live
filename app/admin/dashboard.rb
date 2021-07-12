ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do 
      div "Loading Graphs", class: "loading"
      column id: "FID", class: "column" do 
        div class: "figcaption disabled" do
          div class: "good" do   
            span "<100ms".html_safe
            span "Good"
          end
          div class: "average" do 
            span "100ms&nbsp;-&nbsp;300ms".html_safe
            span "Needs&nbsp;Work".html_safe
          end
          div class: "bad" do
            span ">400ms".html_safe
            span "Bad"
          end
        end
        div "ms", class: "ms disabled"
      end
      column id: "memory" do
      end
      column id: "threads" do
      end
    end
    columns do 
      div "Loading Graphs", class: "loading"
      column id: "graph" do
      end
    end
    columns do
      column do 
        panel "Recent Comics" do 
          table_for Strip.all.order("created_at desc").limit(3) do 
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
