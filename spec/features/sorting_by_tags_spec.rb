feature 'sorting by tags' do
  scenario "so I can see the different categories" do

    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.create(name:'not_bubbles')])
    Link.create(url: 'http://www.fb.com', title: 'facebook', tags: [Tag.create(name:'not_bubbles')])
    Link.create(url: 'http://www.bored.com', title: 'bored', tags: [Tag.first_or_create(name:'bubbles')])
    Link.create(url: 'http://www.reddit.com', title: 'reddit', tags: [Tag.first_or_create(name:'bubbles')])

    visit '/tags/bubbles'
    expect(page).not_to have_content('Google')
    expect(page).not_to have_content('facebook')
    expect(page).to have_content('bored')
    expect(page).to have_content('reddit')

  end
end
