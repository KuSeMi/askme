class UsersController < ApplicationController
  def index
    @users = [
        User.new(
            id: 1,
            name: 'Vadim',
            username: 'installero',
            avatar_url: 'https://secure.gravatar.com/avatar/' \
          '71269686e0f757ddb4f73614f43ae445?s=100'
        ),
        User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]
  end

  def new

  end

  def edit

  end

  def show
    @user = User.new(
      name: 'Vadim',
      username: 'installero',
      avatar_url:'https://secure.gravatar.com/avatar/' \
      '71269686e0f757ddb4f73614f43ae445?s=100'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('15.02.2019')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('15.02.2019')),
      Question.new(text: 'Ты кто по жИзни?', created_at: Date.parse('16.02.2019')),
      Question.new(text: 'Соляра есть?', created_at: Date.parse('17.02.2019')),
      Question.new(text: 'Сколько в Киеве смартфонов?', created_at: Date.parse('18.02.2019')),
      Question.new(text: 'Как увеличить рост ВВП без смс и регистрации?', created_at: Date.parse('19.02.2019'))
    ]

    @new_question = Question.new
  end
end
