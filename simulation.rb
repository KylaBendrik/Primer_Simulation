# frozen_string_literal: true


def move(length, angle, coordinates)
  radians = angle * (Math::PI*2)
  old_x = coordinates[0]
  old_y = coordinates[1]

  delta_x = (Math.cos(radians) * length).round(4)
  delta_y = (Math.sin(radians) * length).round(4)

  new_x = old_x + delta_x
  new_y = old_y + delta_y

  puts "You move #{length} units at an angle of #{radians} radians"
  puts "Starting: #{old_x}, #{old_y}; Deltas: #{delta_x}, #{delta_y}"
  puts "new coords: #{new_x}, #{new_y}"
  coordinates = [new_x, new_y]
end

puts 'Congrats! You are running the simulation.'
move(1, rand(), [1,1])