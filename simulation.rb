# frozen_string_literal: true

class Blob
  def initialize(coords, speed)
    @coordinates = [coords[0], coords[1]]
    @speed = speed

    puts "New Blob Coords: #{@coordinates[0]}, #{@coordinates[1]}"
  end

  def move
    angle = rand
    find_new_coords(@speed, angle, @coordinates)
  end

  def find_new_coords(length, angle, coordinates)
    radians = angle * (Math::PI * 2)
    old_x = coordinates[0]
    old_y = coordinates[1]

    delta_x = (Math.cos(radians) * length).round(4)
    delta_y = (Math.sin(radians) * length).round(4)

    new_x = old_x + delta_x
    new_y = old_y + delta_y

    puts "You move #{length} units at an angle of #{radians} radians"
    puts "Starting: #{old_x}, #{old_y}; Deltas: #{delta_x}, #{delta_y}"
    puts "new coords: #{new_x}, #{new_y}"
    [new_x, new_y]
  end
end

puts 'Congrats! You are running the simulation.'
blob = Blob.new([2, 2], 1)
blob.move
