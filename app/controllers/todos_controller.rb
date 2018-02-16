class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    todo.save
      redirect_to todos_path, notice: 'Se creo la tarea con exito!'
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path, notice: "Se actualizo ToDo con exito"
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path, notice: "Se elimino ToDo con exito"
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.completed = true
    @todo.save
    redirect_to todos_path, notice: "Se completo ToDo con exito"
  end

  def list
    @todos = Todo.all

  end


  private

  def todo_params
    params.require(:todo).permit(:description, :completed)

  end





end
