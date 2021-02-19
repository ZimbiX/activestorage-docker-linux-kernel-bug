require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "attaching a file using IO - this method always works" do
    FileUtils.rm_rf(Rails.root.join('tmp', 'storage'))

    user = User.new
    user.avatar.attach(io: File.open('Gemfile'), filename: 'Gemfile', content_type: 'text/plain')
    user.save
  end

  test "attaching a file using Rack::Test::UploadedFile - this method fails in Docker" do
    test_with_rack_test_uploaded_file
  end

  test "Rack::Test::UploadedFile with naively monkeypatch-fixed IO.copy_stream" do
    class ::IO
      def self.copy_stream(a_io, b_filename)
        File.write(b_filename, a_io.read)
      end
    end

    test_with_rack_test_uploaded_file
  end

  test "Rack::Test::UploadedFile with a file that wasn't mounted in from the host filesystem" do
    test_with_rack_test_uploaded_file(ENV['HOME'] + '/.bashrc')
  end

  test "Rack::Test::UploadedFile with a file that was mounted in, but we created" do
    filename = "tmp/#{Time.now.to_f}"
    File.write(filename, 'blah')
    test_with_rack_test_uploaded_file(filename)
  end

  private

  def test_with_rack_test_uploaded_file(file_path = 'Gemfile')
    FileUtils.rm_rf(Rails.root.join('tmp', 'storage'))

    user = User.new
    file = Rack::Test::UploadedFile.new(file_path, 'text/plain')
    user.avatar.attach(file)
    user.save
  end
end
