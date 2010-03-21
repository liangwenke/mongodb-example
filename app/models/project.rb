class Project# < ActiveRecord::Base
  #attr_accessible :name
  include MongoMapper::Document
  
  key :name, String, :required => true
  key :description, String
  key :homepage, String
  key :public, Boolean, :default => true
  
  timestamps!
  
  #validates_presence_of :name
  
  many :tasks
end
