module ApplicationHelper
  def link_read(link)
    link == "Read"
  end

  def button_starter(link)
    link.read == "Read" ? "Mark as Unread" : "Mark as Read"
  end
end
