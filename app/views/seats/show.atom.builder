xml.instruct!

xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do

  xml.title "QuestionYourCandidates: Updates for #{@seat.name}"
  xml.link "href" => seat_url(@seat, :only_path => false)
  xml.link "href" => seat_url(@seat, :only_path => false, :format => :atom), "rel" => "self"
  updated = @events.empty? ? @seat.updated_at : @events.first.updated_at
  xml.updated updated.xmlschema
  xml.id "tag:questionyourcandidates.org.uk,#{updated.strftime("%Y-%m-%d")}:#{@seat.code}"
  
  @events.each do |event|

    xml.entry do

      xml.title h("#{event.starting_at.to_date.to_s(:short)}: #{event.title}")
      xml.updated event.updated_at.xmlschema
      xml.summary event.description
      xml.author do
        xml.name "QuestionYourCandidates"
      end
      xml.link "href" => seat_event_url(event.seat, event, :only_path => false)
      xml.id "tag:questionyourcandidates.org.uk,#{event.updated_at.strftime("%Y-%m-%d")}:event#{event.id}"
    end
      
  end

end
