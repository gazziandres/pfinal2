ActiveAdmin.register Plato do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :name, :description, :price, :photo

  index do
    column :id
    column :name
    column :description
    column :price


    actions
  end

  form do |f|
    inputs 'Agregando un nuevo Plato' do
      input :name
      input :description
      input :price
      input :photo
    end
    actions
  end

  filter :name, as: :select
  filter :price
  filter :description

end
