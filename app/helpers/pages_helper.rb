module PagesHelper
  def index_rows(pages)
    markup = ""
    pages.each do |page|
      markup << %Q{
        <tr>
          <td>#{link_to page.id, slug_path(page.slug) }</td>
          <td>#{ page.name }</td>
          <td>#{ page.updated_at.to_s(:us) }</td>
          <td>#{page.priority}</td>
          <td>#{page.public}</td>
          <td>
            #{link_to "Edit", edit_slug_path(page.slug), class: 'btn btn-mini'}
            #{link_to "Destroy", slug_path(page.slug), data: {confirm: "Are you sure?"}, class: 'btn btn-mini btn-danger'}
          </td>
        </td>
      }
            
      if page.sub_pages.count > 0
        markup << index_rows(page.sub_pages)
      end
    end
    
    return markup

  end
end
