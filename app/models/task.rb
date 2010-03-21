class Task# < ActiveRecord::Base
  #attr_accessible :name, :project_id, :due_at, :status
  include MongoMapper::Document
  
  key :project_id, ObjectId, :required => true
  key :name, String, :required => true
  key :description, String
  key :status, Integer
  key :priority, Integer
  
  timestamps!
  
  #validates_presence_of :name, :project_id
  
  belongs_to :project
  
  STATUSES = {
    0 => '新建',
    1 => '指派',
    2 => '完成',
    3 => '反馈',
    4 => '关闭'
  }
  
  PRIORITIES = {
    0 => '低',
    1 => '普通',
    2 => '高',
    3 => '紧急',
    4 => '立即'
  }
  
  def self.status_options
    Task::STATUSES.inject([]) {|arr, obj| arr << obj.reverse }
  end
  
  def dis_status
    Task::STATUSES[status]
  end
  
  def self.priority_options
    Task::PRIORITIES.inject([]) {|arr, obj| arr << obj.reverse }
  end
  
  def dis_priority
    Task::PRIORITIES[priority]
  end
  
end
