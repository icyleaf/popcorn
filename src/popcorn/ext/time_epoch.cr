struct Time
  def self.epoch(seconds : Int, location = Location::UTC) : Time
    new(seconds: UNIX_SECONDS + seconds, nanoseconds: 0, location: location)
  end

  def self.epoch_ms(milliseconds : Int, location = Location::UTC) : Time
    milliseconds = milliseconds.to_i64
    seconds = UNIX_SECONDS + (milliseconds / 1_000)
    nanoseconds = (milliseconds % 1000) * NANOSECONDS_PER_MILLISECOND
    new(seconds: seconds, nanoseconds: nanoseconds.to_i, location: location)
  end
end
