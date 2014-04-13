ActiveAdmin.register Post do
  permit_params :message, :tag_ids, :user_id
end
