xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title("絕望網")
    #xml.link(@url)
    xml.description "挑戰社群紅海，這裡只有絕望"
    xml.language "zh-TW"
    xml.ttl "40"

    for note in @notes
      xml.item do
        xml.title("我絕望了！我對+#{note.content}絕望了！ by #{note.nickname}")
        xml.description("絕望指數：#{note.points.to_s}")
        xml.pubDate(note.created_at)
        xml.guid( note_url(request) )
        xml.link( note_url(note) )

        xml.tag!("dc:creator", note.nickname)
      end
    end
  end
end
