ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns class: "first columns" do 
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
        div "ms", class: "unit disabled"
        div class: "tooltip disabled" do 
          span class: "tooltiptext" do
            para "FID measures the time from when a user first interacts with a page (i.e. when they click a link or tap on a button) to the time when the browser is actually able to begin processing event handlers in response to that interaction."
            a "Read More", href: "https://web.dev/fid/", target: "_blank"
          end
        end
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
        div class: "tooltip disabled" do 
          span class: "tooltiptext" do
            para "CLS is a measure of the largest burst of layout shift scores for every unexpected layout shift that occurs during the entire lifespan of a page."
            para "A layout shift occurs any time a visible element changes its position from one rendered frame to the next."
            a "Read More", href: "https://web.dev/cls/", target: "_blank"
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
        div "sec", class: "unit disabled"
        div class: "tooltip disabled" do 
          span class: "tooltiptext" do
            para "The Largest Contentful Paint (LCP) metric reports the render time of the largest image or text block visible within the viewport, relative to when the page first started loading."
            a "Read More", href: "https://web.dev/lcp/", target: "_blank"
          end
        end
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
