class Sanitize
  def strip_script(string)
    string.sub(/<script>/i, "")
  end
end
