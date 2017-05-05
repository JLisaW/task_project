class TaskSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :description
end
