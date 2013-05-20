require 'spec_helper'

describe Page do
  describe '#breadcrumbs' do
    main_page = Page.create(
                          name: 'main page',
                          body: 'some_text',
                          category: 'section',
                          public: 'true')
    sub_level_1 = Page.create(
                           name: 'sub page 1',
                           body: 'some text',
                           category: 'text',
                           public: 'true',
                           parent_id: 1)
    sub_level_2 = Page.create(
                           name: 'sub page 2',
                           body: 'some text',
                           category: 'text',
                           public: 'true',
                           parent_id: 2)
    it 'returns its ancestry as list items' do
      sub_level_2.breadcrumbs.should eq(%q{<li><a href="/main-page">main page</a><span class="divider">/</span></li><li><a href="/sub-page-1">sub page 1</a><span class="divider">/</span></li>})
    end
  end
end
