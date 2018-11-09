class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    render "students/_form"
     @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
    render "students/_form"
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
