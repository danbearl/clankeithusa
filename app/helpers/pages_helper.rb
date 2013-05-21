module PagesHelper
  def index_rows(pages, depth = 0)
    markup = ""
    pages.each do |page|
      markup << %Q{
        <tr>
          <td>#{depth_count(depth)}#{link_to page.id, slug_path(page.slug) }</td>
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
        markup << index_rows(page.sub_pages, depth + 1)
      end
    end
    
    return markup

  end

  def depth_count(depth)
    str = ""
    depth.times do
      str << ">"
    end

    return str
  end

  def pages_array_for_select
    arry = []
    arry << ["None", 0]
    Page.where('parent_id == 0').each do |section|
      arry << [section.name.upcase, section.id]
      arry.concat( build_array section.sub_pages, 1 )
    end
    
    return arry
  end

  def build_array(pages, depth = 0)
    arry = []
    pages.each do |page|
      arry << ["#{depth_count(depth)}#{page.name}", page.id]
      if page.sub_pages.count > 0
        arry.concat(build_array(page.sub_pages, depth + 1))
      end
    end
    return arry
  end

end
