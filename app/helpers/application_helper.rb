module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def declination(number, vopros, voprosa, voprosov)
    residue = number % 100

    return voprosov if residue.between?(11, 14)

    residue = number % 10

    case residue
      when 1 then return vopros
      when 2..4 then return voprosa
      when 5..9, 0 then return voprosov
    end
  end

  def user_bg_color(user)
    if user.bg_color.present?
      user.bg_color
    else
      "#005a55"
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
