class HomeController < ApplicationController

  expose(:blurbs) { Blurb.where(:front_page => true) }

  expose(:events_scoped) do |events|
    events = Event.scoped
    events = events.after(Time.now)
    events = events.before(Time.now + 2592000)
  end

  expose(:announcements) do
    Announcement.where(
      front_page: false,
      site_wide: false
    )
  end

  expose(:front_page_announcements) do
    Announcement.where(
      front_page: true,
      site_wide: false
    )
  end

end
