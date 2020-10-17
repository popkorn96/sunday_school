module AssignmentsHelper
    def teacher_id_field(assignment)
        if assignment.teacher.nil?
          select_tag "assignment[teacher_id]", options_from_collection_for_select(Teacher.all, :id, :to_s)
        else
          hidden_field_tag "assignment[teacher_id]", assignment.teacher_id
        end
      end
end
