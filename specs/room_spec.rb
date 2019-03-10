require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test
  def setup
    @room1 = Room.new("Disco Fever")
    @guest1 = Guest.new("Harry", 20)
    @guest2 = Guest.new("Winston", 30)
    @guest3 = Guest.new("Reggie", 30)
    @guest4 = Guest.new("Sarah", 35)
    @guest5 = Guest.new("Leona", 15)
    @guest6 = Guest.new("Harriet", 40)
    @guest7 = Guest.new("Lara", 45)
    @partyof6 = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]
    @song1 = Song.new("My Girl")
    @song2 = Song.new("Rock DJ")
    @song3 = Song.new("Like a Prayer")
  end

  def test_get_room_name
    assert_equal("Disco Fever", @room1.name)
  end

  def test_count_songs
    assert_equal(0, @room1.count_songs)
  end

  def test_add_song_to_room
    assert_equal(0, @room1.count_songs)
    @room1.add_song_to_room(@song3)
    assert_equal(1, @room1.count_songs)
  end

  def test_count_guests
    assert_equal(0, @room1.count_guests)
  end

  def test_checkin_guest__space_in_room
    assert_equal(0, @room1.count_guests)
    @room1.checkin_guest(@guest1)
    assert_equal(1, @room1.count_guests)
  end

  def test_checkout_guest
    @room1.checkin_guest(@guest1)
    assert_equal(1, @room1.count_guests)
    result = @room1.checkout_guest(@guest1)
    assert_equal("Harry", result.name)
  end

  def test_checkin_guest__room_full
    @room1.guests = @partyof6
    assert_equal(6, @room1.count_guests)
    result = @room1.checkin_guest(@guest7)
    assert_equal("Sorry, this room is full.", result)
  end

  def test_add_money_to_till
    result = @room1.add_money_to_till(10)
    assert_equal(60, result)
  end


end
