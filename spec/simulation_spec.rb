require 'spec_helper'
require_relative '../simulation.rb'

describe 'move' do
  before do
    Object.send(:public, *Object.private_instance_methods)
  end

  it 'returns a set of new coordinates' do
    blob = Blob.new([1, 1], 1)



    expect(blob.find_new_coords(blob.speed, 0.5, blob.coordinates)).to eq [0.0, 1.0]
  end
end