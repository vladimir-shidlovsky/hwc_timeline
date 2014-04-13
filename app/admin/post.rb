ActiveAdmin.register Post do
  permit_params :message, :user_id, tag_ids: []

  controller do
    before_action :clean_tag_ids, only: [:create, :update]

    def clean_tag_ids
      params[:post][:tag_ids] &&= Array(params[:post][:tag_ids]).reject(&:blank?)
    end
  end

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all
      f.input :message
      f.input :tag_ids, as: :select, collection: Tag.all, multiple: true
    end
    f.actions
  end
end
