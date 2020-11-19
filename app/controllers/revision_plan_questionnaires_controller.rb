class RevisionPlanQuestionnairesController < QuestionnairesController

  def action_allowed?
    case params[:action]
    when 'edit'
      questionnaire = Questionnaire.find(params[:id])
      @teams_user = TeamsUser.find(params[:team_id]) 
      (user_logged_in? && 
        @teams_user.collect { |u| u.id }.include?(session[:user].id)) || super
    else
      super
    end
  end

  def new
    begin
      questionnaire = RevisionPlanQuestionnaire.get_questionnaire_for_current_round(params[:team_id])
      redirect_to action: 'edit', id: questionnaire.id
    rescue StandardError
      flash[:error] = $ERROR_INFO
    end
  end

end
