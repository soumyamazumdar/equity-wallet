module ApplicationHelper

	def pluralize_without_count(count, noun, text = nil)
	  if count != 0
	    count == 1 ? "an #{noun}#{text}" : "#{noun.pluralize}#{text}"
	  end
  end

  def link_back(path)
    link_to ('<span class="glyphicon glyphicon-hand-left" area-hidden="true"></span> Back').html_safe,path,
    class: "btn btn-outline-light", id: "btn"
  end

  def delete_link(path)
    link_to ('<span class="glyphicon glyphicon-remove" area-hidden="true"></span>remove').html_safe,
    path,
    method: :delete,data: { confirm: "Are you sure?" },
    class: 'link-to'
  end

  def edit_link(path)
    link_to ('<span class="glyphicon glyphicon-pencil" area-hidden="true"></span> Edit').html_safe,path
  end

end
