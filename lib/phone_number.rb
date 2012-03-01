require "hobo_fields"

class PhoneNumber < DelegateClass(String)

  COLUMN_TYPE = :string

  HoboFields.register_type(:phone_number, self)

  def validate
    "should match the general pattern xxx-xxx-xxxx" unless blank? || valid?
  end

  def valid?
    [7, 10].include?(syntaxless.length)
  end

  def syntaxless
    gsub(/\D/, "")
  end

  def has_area_code?
    area_code.present?
  end

  def area_code
    if md = syntaxless.match(/(\d{3})\d{3}\d{4}$/) then
      md[1]
    else
      nil
    end
  end

  def exchange
    if md = syntaxless.match(/(\d{3})\d{4}$/) then
      md[1]
    else
      nil
    end
  end

  def number
    if md = syntaxless.match(/\d{4}$/) then
      md[0]
    else
      nil
    end
  end

  def to_s
    syntaxless
  end

  def to_html(xmldoctype = true)
    if has_area_code? then
      %Q(<span class="phone-number">(<span class="area-code">#{area_code}</span>)&nbsp;<span class="exchange">#{exchange}</span>-<span class="number">#{number}</span></span>)
    else
      %Q(<span class="phone-number"><span class="exchange">#{exchange}</span>-<span class="number">#{number}</span></span>)
    end
  end

end
