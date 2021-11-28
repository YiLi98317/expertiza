class AddRevisionDoneToRevisionPlanTeamMaps < ActiveRecord::Migration
  def change
    add_column :revision_plan_team_maps, :revision_done, :boolean
  end
end
