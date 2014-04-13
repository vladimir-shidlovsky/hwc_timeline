ActiveAdmin.register Event do
  permit_params do
   permitted = [:title, :description, :date, tag_ids: []]
   permitted
  end

  controller do
    before_action :clean_tag_ids, only: [:create, :update]

    def clean_tag_ids
      params[:event][:tag_ids] &&= Array(params[:event][:tag_ids]).reject(&:blank?)
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :date, as: :datepicker, datepicker_options: { min_date: Time.zone.now.to_date, max_date: "+3M" }
      f.input :tag_ids, as: :select, collection: Tag.all, multiple: true
    end
    f.actions
  end
end
