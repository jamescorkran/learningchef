require 'spec_helper'

describe 'tomcat::default' do
	describe command("curl http://localhost:8080") do
		its(:stdout) { should match /Tomcat/ }
	end
end
