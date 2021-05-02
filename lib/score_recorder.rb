class ScoreRecorder
  def next_input_roll(frames)
    1 if new_game?(frames) || full_frame?(frames)
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

  def full_frame?(frames)
    frames[0].length == 2
  end
end
