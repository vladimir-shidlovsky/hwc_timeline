ActiveAdmin.register Game do
  controller do
    before_action :clean_tag_ids, only: [:create, :update]

    def clean_tag_ids
      params[:game][:tag_ids] &&= Array(params[:game][:tag_ids]).reject(&:blank?)
    end
  end

  index do
    column :date
    column :team_1 do |game|
      game.team_1.name
    end
    column :team_2 do |game|
      game.team_2.name
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :team_1_id, as: :select, collection: Team.all
      f.input :team_2_id, as: :select, collection: Team.all
      f.input :date, as: :datetime
      f.input :tag_ids, as: :select, collection: Tag.all, multiple: true
    end
    f.actions
  end

  permit_params :team_1_id, :team_2_id, :date, tag_ids: []
end
