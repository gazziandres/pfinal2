ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
       panel "Recent Orders" do
         table_for Order.complete.order("id desc").limit(10) do
           column("State") { |order| status_tag(order.state) }
           column("Customer") { |order| link_to(order.user.email, admin_user_path(order.user)) }
           column("Total")   { |order| number_to_currency order.total_price }
         end
       end
     end

      column do
        panel "Usuarios" do
            ul do
              li "Usuarios registrados: #{User.count}"
              li "Administradores registrados:  #{AdminUser.count}"
            end
        end
      end
    end
  end
end
