module ArtistsHelper
  def album_for(artist, _options = { size: 80 })
    url = artist.top_albums[0]['image'][1]['#text']
    if url.empty?
      smile = 'smile.png'
      image_tag(smile, alt: artist.name, class: 'gravatar')
    else
      image_tag(url, alt: artist.name, class: 'gravatar')
    end
  end
end
