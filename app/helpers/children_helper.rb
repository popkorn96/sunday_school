module ChildrenHelper
    def children_for_select
        Child.all.collect { |c| [c.to_s, c.id] }
    end
end
