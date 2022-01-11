require 'rails_helper'

class Testing
  def self.hello_world
    'Hello, world!'
  end
end

RSpec.describe Testing do
  it 'returns hello world' do
    expect(described_class.hello_world).to eq 'Hello, world!'
  end
end
