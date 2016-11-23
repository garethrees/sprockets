require 'sprockets_test'

class TestManifest < Sprockets::TestCase
  def setup
    @env = Sprockets::Environment.new(".") do |env|
      env.append_path(fixture_path('default'))
    end
  end

  test "@import overridden file from load path" do
    @env.prepend_path(fixture_path('override'))
    assert_equal <<-EOS, render('default/main.scss')
overridden {
color: purple; }
    EOS
  end

  def render(path)
    path = fixture_path(path)
    @env[path].to_s
  end

end

