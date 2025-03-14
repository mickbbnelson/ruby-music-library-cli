require 'bundler'
Bundler.require

module Concerns
    module Findable
        def find_by_name(name)
            self.all.detect{|object| object.name == name}
        end

        #def self.create(name)
         #   new(name).tap{|song| song.save} 
        #end

        def find_or_create_by_name(name)
            self.find_by_name(name) || self.create(name) 
        end
    
    end
end

require_all 'lib'

