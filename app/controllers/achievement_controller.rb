class AchievementController < ApplicationController
  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      redirect_to root_path, notice: 'Achievement has been created'
      return
    end
    render :new
  end

  def show
    @achievement = Achievement.find params[:id]
    @description = Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(@achievement.description)
  end

  private

  def achievement_params
    params.require(:achievement).permit %w(title description featured privacy cover_image)
  end
end