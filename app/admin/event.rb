ActiveAdmin.register Event do
  permit_params do
   permitted = [:title, :description, 'date(1i)', 'date(2i)', 'date(3i)', 'date(4i)', 'date(5i)']
   permitted
  end
end
