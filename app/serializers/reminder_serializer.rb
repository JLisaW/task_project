class ReminderSerializer < ActiveModel::Serializer
  attributes :id, :to_do, :priority, :type
end
