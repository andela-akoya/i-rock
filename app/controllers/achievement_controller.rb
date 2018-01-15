class AchievementController < ApplicationController
  def new
    @achievement = Achievement.new
  end

  def index
    @achievements = Achievement.public_access
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      redirect_to achievement_path(@achievement), notice: 'Achievement has been created'
      return
    end
    render :new
  end

  def show
    @achievement = Achievement.find params[:id]
  end

  def edit
    @achievement = Achievement.find(params[:id])
  end

  def update
    @achievement = Achievement.find(params[:id])
    if @achievement.update_attributes(achievement_params)
      redirect_to achievement_path(@achievement), notice: 'Achievement has been updated'
      return
    end
    render :edit
  end

  def destroy
    @achievement = Achievement.find(params[:id])
    if @achievement.destroy
      redirect_to achievement_path
      return
    end
  end

  private

  def achievement_params
    params.require(:achievement).permit %w(title description featured privacy cover_image)
  end
end