class RoomPresenter < BasePresenter

  presents :room
  
  def value
    f = room.fullvalue
    r = "Ex VAT  Estimate:#{h.ihelper f[0][0]} Purchase:#{h.ihelper f[1][0]} Sales:#{h.ihelper f[2][0]} <br />"
    r += "Inc VAT Estimate:#{h.ihelper f[0][1]} Purchase:#{h.ihelper f[1][1]} Sales:#{h.ihelper f[2][1]}"
    r.html_safe
  end
  
end
