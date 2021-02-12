require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "attaching a file" do
    FileUtils.rm_rf(Rails.root.join('tmp', 'storage'))

    user = User.new

    user.avatar.attach(io: File.open('Gemfile'), filename: 'Gemfile', content_type: 'text/plain')

    file =
      Rack::Test::UploadedFile.new(
        'Gemfile',
        'text/plain',
      )

    user.avatar.attach(file)

    user.save
  end
end
