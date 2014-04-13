ActiveAdmin.register Game do
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
    end
    f.actions
  end
  permit_params [:team_1_id, :team_2_id, :date]
end
