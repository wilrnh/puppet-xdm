require 'spec_helper'
describe 'xdm' do

  context 'with defaults for all parameters' do
    it { should contain_class('xdm') }
  end
end
