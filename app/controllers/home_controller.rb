class HomeController < ApplicationController

  expose(:blurbs) { Blurb.where(:front_page => true) }

  expose(:events_scoped) do |events|
    events = Event.scoped
    events = events.after(Time.now)
    events = events.before(Time.now + 2592000)
  end

  expose(:announcements) do
    Announcement.where(
      live: true,
      site_wide: false
    )
  end

  expose(:images) {Image.where(featured: true)}

end
