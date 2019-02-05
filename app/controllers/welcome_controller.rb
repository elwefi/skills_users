class WelcomeController < ApplicationController
  def index
  	@skills_points = SqlQuery::SkillsPoints.perform
  end
end
