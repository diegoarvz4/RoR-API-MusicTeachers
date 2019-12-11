class MusicTeachersController < ApplicationController
  before_action :set_music_teacher, only: [:show, :update, :destroy]

  # GET /music_teachers
  def index
    @music_teachers = MusicTeacher.all
    json_response(@music_teachers)
  end

  # POST /music_teachers
  def create
    @music_teacher = MusicTeacher.create!(music_teacher_params)
    json_response(@music_teacher, :created)
  end

  # GET /music_teachers/:id
  def show
    json_response(@music_teacher)
  end

  # PUT /music_teachers/:id
  def update
    @music_teacher.update(music_teacher_params)
    head :no_content
  end

  # DELETE /music_teachers/:id
  def destroy
    @music_teacher.destroy
    head :no_content
  end

  private

  def music_teacher_params
    # whitelist params
    params.permit(:name)
  end

  def set_music_teacher
    @music_teacher = MusicTeacher.find(params[:id])
  end
end
