require "crsfml"
require "./Math"

class Boid
  def initialize(@position : SF::Vector3f = SF::Vector3f.new(), @weight : Float32 = 1.0_f32, @angle : Float32 = 0.0_f32, @size : Float32 = 1.0_f32, @color : SF::Color = SF::Color::White)
    # @position = SF::Vector3f.new(); #center point of the boid
    @velocity = SF::Vector3f.new(); #m/s
    @acceleration = SF::Vector3f.new(); #m/s^2
    # @weight = 1.0; #grams
    # @angle = 0.0; #radians
    # @size = 1.0 #meters; size of the boid
    # @color = SF::Color::White;
  end

  def getVertecies
    verticies = SF::VertexArray.new(SF::TriangleFan, 4);
    t = SF::Transform.new().rotate(Math.deg(@angle),SF::Vector2f.new(@position.x,@position.y));
    p1 = t.transform_point(@position.x,@position.y+((Math.sqrt(3.0)/3.0)*@size));
    p2 = t.transform_point(@position.x - (@size/3.0),@position.y-((Math.sqrt(3.0)/6.0)*@size));
    p3 = t.transform_point(@position.x,@position.y-((Math.sqrt(3.0)/6.0)*(@size/2.0)));
    p4 = t.transform_point(@position.x + (@size/3.0),@position.y-((Math.sqrt(3.0)/6.0)*@size));
    verticies[0] = SF::Vertex.new(p1,@color)
    verticies[1] = SF::Vertex.new(p2,@color)
    verticies[2] = SF::Vertex.new(p3,@color)
    verticies[3] = SF::Vertex.new(p4,@color)

    return verticies;
  end

  def applyForce()
    return;
  end

  def draw(window : SF::RenderWindow)
    window.draw(self.getVertecies);
  end
end
