class ScoreRecorder
  def next_input_roll(frames)
    if game_end?(frames)
      nil
    elsif new_game?(frames) || completed_frame?(frames)
      1
    else
      2
    end
  end

  def next_input_frame(frames)
    if next_input_roll(frames) == 1
      next_frame(frames)
    else
      this_frame(frames)
    end
  end

  private

  def this_frame(frames)
    frames.length
  end

  def next_frame(frames)
    this_frame(frames) + 1
  end

  def new_game?(frames)
    frames == []
  end

  def completed_frame?(frames)
    full_frame?(frames) || strike?(frames)
  end

  def full_frame?(frames)
    frames[-1].length == 2
  end

  def tenth_frame?(frames)
    frames.length == 10
  end

  def strike?(frames)
    frames[-1] == [10]
  end

  def game_end?(frames)
    tenth_frame?(frames) && full_frame?(frames)
  end
end
