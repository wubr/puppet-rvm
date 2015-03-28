require 'spec_helper'

describe 'rvm::gnupg_key', :compile do

  it { should contain_gnupg_key('rvm_D39DC0E3') }

end
