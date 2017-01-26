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

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education,bananas'
    click_button("Save Link")
    link = Link.first #why run the first method on the Link class? try create as well.
    expect(link.tags.map(&:name)).to include('education','bananas')

    # visit
    #  Link.create(url: 'http://www.google.com', title: 'Google')
    #  [Tag.first_or_create(name:'not_bubbles')]
    # #  Link.create(url: 'http://www.fb.com', title: 'facebook', tags: [Tag.create(name:'not_bubbles')])
    # #  Link.create(url: 'http://www.bored.com', title: 'bored', tags: [Tag.first_or_create(name:'bubbles')])
    # #  Link.create(url: 'http://www.reddit.com', title: 'reddit', tags: [Tag.first_or_create(name:'bubbles')])
    #
    # visit '/tags/add'
    # fill_in :new_tag, with: "troubles"
    # click_button "Save New Tag"
    # expect()


  end

end
