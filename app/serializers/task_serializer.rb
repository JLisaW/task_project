class TaskSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :description
  has_one :description
end
