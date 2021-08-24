require './game/frame'
require 'active_support/core_ext/module'
require './rules/standard_rules'
class Game
  attr_reader :frames
  delegate :bowl_frame, to: :@rule_set
  def initialize(number_of_frames, rules = StandardRules.new)
    @rule_set = rules
    @frames = []
    number_of_frames.times {@frames.push(Frame.new)}
    @frames.last.set_last_frame
  end
  def to_s
    top_row = "--------" * frames.size
    top_row += "-"
    second_row = ""
    frames.each do |frame|
      if frame.last_frame?
        last_throw = frame.throws[2].pins == @rule_set.class::MAX_PINS ? "X" : frame.throws[2].pins
        second_throw = frame.throws[1].pins == @rule_set.class::MAX_PINS ? "X" : frame.throws[1].pins
        second_row += "| |X|#{second_throw}|#{last_throw}" if frame.is_strike?
        second_row += "| |#{second_throw}|/|#{last_throw}" if frame.is_spare?
        second_row += "| |#{second_throw}|#{last_throw}|_" if frame.is_open?
      else
        second_row += "|   |X|_" if frame.is_strike?
        second_row += "|   |#{frame.throws.first.pins}|/" if frame.is_spare?
        second_row += "|   |#{frame.throws.first.pins}|#{frame.throws[1].pins}" if frame.is_open?
      end
    end
    second_row += "|"
    third_row = "|       " * frames.size
    third_row += "|"
    fourth_row = "|-------" * frames.size
    fourth_row += "|"
    [top_row, second_row, third_row, fourth_row].join("\n")
  end
end
