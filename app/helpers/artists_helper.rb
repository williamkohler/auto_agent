module ArtistsHelper
  # def album_for(artist, _options = { size: 80 })
  #   url = artist.top_albums[0]['image'][1]['#text']
  #   if url.empty?
  #     smile = 'smile.png'
  #     image_tag(smile, alt: artist.name, class: 'gravatar')
  #   else
  #     image_tag(url, alt: artist.name, class: 'gravatar')
  #   end
  # end

  # Size can be 1 - 4
def album_for(artist, options = { size: 1 })
  size = options[:size]

  if size == 3
    album_art = 'luke-chesser-large'
  elsif size == 2
    album_art ='luke-chesser-medium'
  elsif size == 1
    album_art = 'luke-chesser-small'
  else
    raise 'StandardError'
  end
  if artist.top_albums.empty?
    return image_tag(album_art, alt: artist.name, class: 'album')
  else
    url = artist.top_albums[0]['image'][size]['#text']
    if url.empty?
      image_tag(album_art, alt: artist.name, class: 'album')
    else
      image_tag(url, alt: artist.name, class: 'album')
    end
    end
  end
end
