class Room
  attr_reader :name, :entry_fee
  attr_accessor :songs, :guests, :till

  def initialize(name)
    @name = name
    @songs = []
    @guests = []
    @entry_fee = 10
    @till = 50
  end

  def add_song_to_room(song)
    return @songs.push(song)
  end

  def count_songs
    return @songs.count
  end

  def count_guests
    return @guests.count
  end

  def checkin_guest(guest)
    if @guests.count < 6
      return @guests.push(guest)
    else
      return "Sorry, this room is full."
    end
  end

  def checkout_guest(guest)
    return @guests.delete(guest)
  end

  def add_money_to_till(sum)
    return @till += sum
  end


end
