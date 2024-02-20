class TodosController < ApplicationController
  # GET /todos
  def index
    # 日付が新しい順に10件まで取得する
    @todos = Todo.all.order(created_at: :desc).limit(10)

    render json: @todos
  end

  # GET /todos/:id
  def show
    @todo = Todo.find(params[:id])

    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def todo_params
    params.require(:todo).permit(:title, :content)
  end
end
