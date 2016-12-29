class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def active
    @student = Student.find(params[:id])
    toggle_active(@student)

    redirect_to student_path(@student)
  end

  def show
    @student = Student.find(params[:id])

    if @student.active
      @string = "This student is currently active."
    else
      @string = "This student is currently inactive."
    end
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def toggle_active(student)
      if student.active
        student.active = false
      else
        student.active = true
      end

      student.save
    end
end
