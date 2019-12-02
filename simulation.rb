# frozen_string_literal: true

class Blob
  attr_accessor :speed, :coordinates
  def initialize(coords, speed, sense)
    @coordinates = [coords[0], coords[1]]
    @speed = speed
    @sense = sense

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

class World
  def initialize(size, num_blobs)
    @size = size
    @day = 0
    @tick = 0
    @blobs = []
    @food = []

    num_blobs.times do
      @blobs.push(Blob.new(starting_coords, 1, 1))
    end
  end

  def starting_coords
    # either x or y needs to be at 0 or @size
    edge = 0
    other = rand * @size
    edge = 10 if rand > 0.5

    if rand > 0.5
      x = edge
      y = other
    else
      y = edge
      x = other
    end

    [x, y]
  end

  def display
    puts "Day: #{@day} / Tick: #{@tick}"
    puts "Num Blobs: #{@blobs.length}"
    puts "Food: #{@food.length}"
  end

  def day
    @day += 1
    add_food(4)
  end

  def add_food(num_food)
    num_food.times do
      @food.push [(rand * @size), (rand * @size)]
    end
  end

  def tick
    @tick += 1
    if @tick == 10
      day
      @tick = 0
    end
    display
  end
end

puts 'Congrats! You are running the simulation.'

world = World.new(10, 2)

world.day
input = gets.chomp

while input.empty?
  world.tick
  input = gets.chomp
end
