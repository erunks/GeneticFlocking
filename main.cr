require "crsfml"
require "./Math"
require "./Boid"

# p Math::PI;
# p Math.rad(0.0);
# p Math.deg(Math.rad(180.0));

window = SF::RenderWindow.new(
  SF::VideoMode.new(400,300),
  "test",
  settings: SF::ContextSettings.new(depth: 24, antialiasing: 8)
);
window.vertical_sync_enabled = true;


b = Boid.new(SF::Vector3f.new(150.0_f32,150.0_f32,0.0_f32),1.0_f32,Math.rad(90.0),50.0_f32);


while window.open?()
  # check all the window's events that were triggered since the last iteration of the loop
  while event = window.poll_event()
    # "close requested" event: we close the window
    case event
    when SF::Event::Closed
      window.close();
    end
  end

  window.clear(SF::Color::Black);
  b.draw(window);

  window.display();
end
