class TypingRacerController < ApplicationController
  def index
  end

  def race
    difficulty = params[:difficulty]

    # Define texts for each difficulty level
    texts = {
      "easy" => "The quick brown fox jumps over the lazy dog.",
      "medium" => "Typing is a skill that improves with practice and patience.",
      "hard" => "Complexity arises not from the number of words, but from their structure and variation.",
    }

    # Assign @text based on difficulty param, fallback to easy if invalid or missing
    @text = texts[difficulty] || texts["easy"]

    render :race
  end

  def finish
    @original_text = params[:original_text]
    @typed_text = params[:typed_text]
    @time_taken = params[:time].to_f

    @words_typed = @typed_text.strip.split(/\s+/).size
    @wpm = (@words_typed / @time_taken * 60).round rescue 0

    correct_chars = @typed_text.each_char.with_index.count do |char, i|
      @original_text[i] == char
    end
    @accuracy = if @original_text.length > 0
        (correct_chars.to_f / @original_text.length * 100).round
      else
        0
      end

    # ✅ make sure you are rendering (not redirecting)
    render :finish
  end
end
