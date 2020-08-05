module Types
  class QueryType < Types::BaseObject
    field :all_users, [UserType], null: false
    field :all_courses, [CourseType], null: false

    def all_users
      User.all
    end
  
    def all_courses
      Course.all
    end
  end
end
