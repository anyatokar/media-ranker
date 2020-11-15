class ApplicationController < ActionController::Base
  def flash_success(success_message)
    flash["alert alert-success"] = success_message
  end

  # def flash_warning(message, work)
  #   flash["alert alert-warning"] = "A problem occurred: #{message} #{work}"
  #   flash["alert alert-warning2"] = "• #{work.errors.first[0]} #{work.errors.first[1]}"
  # end

  def flash_warning(warning_message, category)
    flash["alert alert-warning"] = warning_message
    # flash["alert alert-warning2"] = category.errors[:title].to_sentence
    flash["alert alert-warning2"] = category.errors.first[1]
  end
end

