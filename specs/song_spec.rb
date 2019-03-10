require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class TestSong < Minitest::Test

def setup
  @song1 = Song.new("My Girl")
  @song2 = Song.new("Rock DJ")
  @song3 = Song.new("Like a Prayer")
end

def test_get_song_name
  assert_equal("Rock DJ", @song2.name)
end

end
