ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do 
      column do 
        panel "Admnistration Links", class: "admin_panel" do
          render("/admin/admin_links", model: "dashboard")
        end
      end
      column do
        panel "Contact the Developer", class: "admin_panel" do
          render("/admin/sidebar_links", model: "dashboard")
        end
      end
    end
  end 
end
