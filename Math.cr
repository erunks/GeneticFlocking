require "crsfml"

module Math
  def rad(d)
    return ((d * PI)/180.0).to_f32;
  end

  def deg(r)
    return ((r * 180.0)/PI).to_f32;
  end

  def euclidian(n : SF::Vector2, m : SF::Vector2)
    # return sqrt(pow((m.x - n.x),2.0_f32) + pow((m.y - n.y),2.0_f32));
  end

  def euclidian(n : SF::Vector3, m : SF::Vector3)
    return;
  end
end
