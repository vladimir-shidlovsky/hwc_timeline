ActiveAdmin.register Team do
  permit_params [:name_en, :name_ru, tag_ids: []]

  controller do
    before_action :clean_tag_ids, only: [:create, :update]

    def clean_tag_ids
      params[:team][:tag_ids] &&= Array(params[:team][:tag_ids]).reject(&:blank?)
    end
  end

  form do |f|
    f.inputs do
      f.input :name_ru
      f.input :name_en
      f.input :tag_ids, as: :select, collection: Tag.all, multiple: true
    end
    f.actions
  end
end
