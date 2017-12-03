module ShowsHelper

  def format_date date
    if date == nil
      return ''
    else
      ii = date.to_i
      time = Time.at(ii / 1000).utc
      date = time.to_date
      date.strftime('%A %B %d, %Y')
    end
  end
  def deal_stage(stage)
    issued = "323905d1-2784-4fc5-b4bd-d544348f2668"
    if stage == issued
      "issued"
    end
  end

end
