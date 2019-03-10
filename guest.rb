class Guest
  attr_reader :name
  attr_accessor :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    @fave_song = @song1
  end

  def guest_has_sufficient_funds?(sum)
    if @wallet >= sum
      return true
    else
      return false
    end
  end

  def take_money_from_wallet(sum)
    if guest_has_sufficient_funds?(sum) == true
      return @wallet -= sum
    else
      return "You don't have enough money!"
    end
  end

  def pay_karaoke_entry_fee(room)
    if guest_has_sufficient_funds?(room.entry_fee) == true
      take_money_from_wallet(room.entry_fee)
      room.add_money_to_till(room.entry_fee)
    else
      return "Insufficient funds!"
    end
  end

  # def fave_song_in_room?(room)
  #   if room.songs.include?(@fave_song)
  #     return "Whooo!"
  #   else
  #     return "Awww..."
  #   end
  # end

end
