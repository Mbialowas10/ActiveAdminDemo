ActiveAdmin.register Horse do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :age, :top_speed, :number_of_legs, :breed_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :age, :top_speed, :number_of_legs, :breed_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
