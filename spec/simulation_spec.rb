require 'spec_helper'
require_relative '../simulation.rb'

describe 'move' do
  before do
    Object.send(:public, *Object.private_instance_methods)
  end

  it 'returns a set of new coordinates' do
    expect(move(1, 0.5, [1,1])).to eq [0.0, 1.0]
  end
end