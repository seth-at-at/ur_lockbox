module ApplicationHelper
  def link_read(link)
    link == "Read"
  end

  def mark_button(link)
    link.read == "Read" ? "Mark as Unread" : "Mark as Read"
  end
end
