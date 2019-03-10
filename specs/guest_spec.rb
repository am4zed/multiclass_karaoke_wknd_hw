require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestGuest < Minitest::Test
  def setup
    @room1 = Room.new("Disco Fever")
    @guest1 = Guest.new("Harry", 20)
    @guest2 = Guest.new("Winston", 30)
    @guest3 = Guest.new("Reggie", 30)
    @guest4 = Guest.new("Sarah", 35)
    @guest5 = Guest.new("Leona", 15)
    @guest6 = Guest.new("Harriet", 40)
    @guest7 = Guest.new("Lara", 45)
    @poorguest = Guest.new("Steve", 5)
    @partyof6 = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]
    @song1 = Song.new("My Girl")
    @song2 = Song.new("Rock DJ")
    @song3 = Song.new("Like a Prayer")
  end

  def test_get_guest_name
    assert_equal("Harry", @guest1.name)
  end

  def test_guest_has_sufficient_funds__false
    result = @poorguest.guest_has_sufficient_funds?(10)
    assert_equal(false, result)
  end

  def test_guest_has_sufficient_funds__true
    result = @guest3.guest_has_sufficient_funds?(@room1.entry_fee)
    assert_equal(true, result)
  end

  def test_take_money_from_wallet__sufficient_funds
    result = @guest7.take_money_from_wallet(10)
    assert_equal(35, result)
  end

  def test_take_money_from_wallet__insufficient_funds
    result = @poorguest.take_money_from_wallet(10)
    assert_equal("You don't have enough money!", result)
  end

  def test_pay_karaoke_entry_fee__sufficient_funds
    @guest5.pay_karaoke_entry_fee(@room1)
    assert_equal(5, @guest5.wallet)
    assert_equal(60, @room1.till)
  end

  def test_pay_karaoke_entry_fee__insufficient_funds
    result = @poorguest.pay_karaoke_entry_fee(@room1)
    assert_equal("Insufficient funds!", result)
  end

  # def test_fave_song_in_room?
  #   @room1.add_song_to_room(@song1)
  #   @room1.add_song_to_room(@song2)
  #   result = @guest1.fave_song_in_room?(@room1)
  #   assert_equal("Whooo!", result)
  # end

end
