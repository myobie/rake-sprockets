class EyString < String
  def method_missing(name, *args, &blk)
    sname = name.to_s
    if sname =~ /\?$/
      self == sname
    else
      super
    end
  end
end

class String
  def ey?
    EyString.new(self)
  end
end
