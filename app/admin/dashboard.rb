ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # columns class: "first columns" do 
    #   column id: "FID" do 
    #     div class: "loading" do
    #      span "&nbsp;Loading...&nbsp;".html_safe
    #     end
    #     div class: "figcaption disabled" do
    #       div class: "good" do   
    #         span "<100ms".html_safe
    #         span "Good"
    #       end
    #       div class: "average" do 
    #         span "100ms&nbsp;-&nbsp;300ms".html_safe
    #         span "Needs&nbsp;Work".html_safe
    #       end
    #       div class: "bad" do
    #         span ">400ms".html_safe
    #         span "Bad"
    #       end
    #     end
    #     div class: "tooltip disabled" do 
    #       span class: "tooltiptext" do
    #         para "<strong>First Input Delay</strong> measures the time from when a user first interacts with a page (i.e. when they click a link or tap on a button) to the time when the browser is actually able to begin processing events in response to that interaction.".html_safe
    #         a "Click Here to Read More", href: "https://web.dev/fid/", target: "_blank"
    #       end
    #     end
    #   end
    #   column id: "CLS" do
    #     div class: "loading" do
    #      span "&nbsp;Loading...&nbsp;".html_safe
    #     end
    #     div class: "figcaption disabled" do
    #       div class: "good" do   
    #         span "<0.1".html_safe
    #         span "Good"
    #       end
    #       div class: "average" do 
    #         span "0.1&nbsp;-&nbsp;0.25".html_safe
    #         span "Needs&nbsp;Work".html_safe
    #       end
    #       div class: "bad" do
    #         span ">0.25".html_safe
    #         span "Bad"
    #       end
    #     end
    #     div class: "tooltip disabled" do 
    #       span class: "tooltiptext" do
    #         para "<strong>Comulative Layout Shift</strong> measures the largest burst of <em>Layout Shift Scores (LSS)</em> for every sudden layout jump that occurs during the lifespan of a page. In other words, CLS is the unexpected shifting of web page elements while the page is still loading.".html_safe
    #         a "Click Here to Read More", href: "https://web.dev/cls/", target: "_blank"
    #       end
    #     end
    #   end
    #   column id: "LCP" do
    #     div class: "loading" do
    #      span "&nbsp;Loading...&nbsp;".html_safe
    #     end
    #     div class: "figcaption disabled" do
    #       div class: "good" do   
    #         span "<2.5&nbsp;sec".html_safe
    #         span "Good"
    #       end
    #       div class: "average" do 
    #         span "2.6&nbsp;sec&nbsp;-&nbsp;4.0&nbsp;sec".html_safe
    #         span "Needs&nbsp;Work".html_safe
    #       end
    #       div class: "bad" do
    #         span ">4.0sec".html_safe
    #         span "Bad"
    #       end
    #     end
    #     div class: "tooltip disabled" do 
    #       span class: "tooltiptext" do
    #         para "<strong>Largest Contentful Paint</strong> reports the render time of the largest image (or text block) visible, relative to when the page first started loading.".html_safe
    #         a "Click Here to Read More", href: "https://web.dev/lcp/", target: "_blank"
    #       end
    #     end
    #   end
    # end
    # columns do
    #   column id: "Graph" do
    #     div class: "loading" do
    #      span "&nbsp;Loading...&nbsp;".html_safe 
    #     end
    #     div
    #   end
    # end
    columns do 
      column do
        panel "Contact the Developer", class: "developer_info" do
          render("/admin/sidebar_links", model: "dashboard")
        end
      end
    end
  end 
end
