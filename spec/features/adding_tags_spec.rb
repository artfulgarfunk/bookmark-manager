feature 'adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education'

    click_button("Save Link")
    link = Link.first #why run the first method on the Link class? try create as well.
    expect(link.tags.map(&:name)).to include('education')
  end

end
