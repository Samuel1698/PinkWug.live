ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do 
      column id: "FID" do 
        div class: "loading" do
         span "&nbsp;Loading...&nbsp;".html_safe
        end
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
      column id: "CLS" do
        div class: "loading" do
         span "&nbsp;Loading...&nbsp;".html_safe
        end
        div class: "figcaption disabled" do
          div class: "good" do   
            span "<0.100".html_safe
            span "Good"
          end
          div class: "average" do 
            span "0.200&nbsp;-&nbsp;0.250".html_safe
            span "Needs&nbsp;Work".html_safe
          end
          div class: "bad" do
            span ">0.250".html_safe
            span "Bad"
          end
        end
      end
      column id: "LCP" do
        div class: "loading" do
         span "&nbsp;Loading...&nbsp;".html_safe
        end
        div class: "figcaption disabled" do
          div class: "good" do   
            span "<2.5&nbsp;sec".html_safe
            span "Good"
          end
          div class: "average" do 
            span "2.6&nbsp;sec&nbsp;-&nbsp;4.0&nbsp;sec".html_safe
            span "Needs&nbsp;Work".html_safe
          end
          div class: "bad" do
            span ">4.0sec".html_safe
            span "Bad"
          end
        end
        div "sec", class: "sec disabled"
      end
    end
    columns do 
      column id: "Graph" do
        div class: "loading" do
         span "&nbsp;Loading...&nbsp;".html_safe 
        end
        div
      end
    end
    columns do
      column do
        panel "Contact the Developer", class: "developer_info" do
          render("/admin/sidebar_links", model: "dashboard")
        end
      end
    end
  end 
end
