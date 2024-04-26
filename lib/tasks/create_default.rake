namespace :initialize do
  desc 'Create default data'
  task create_default: :environment do
    User.create email: 'test.man@test.com', password: 'Test123'

    Show.find_or_create_by name: 'True Lies', show_type: 'movie', year: 1993, detail: 'Arnold is here'
    Show.find_or_create_by name: 'Inception', show_type: 'movie', year: 2010, detail: 'Inception'
    Show.find_or_create_by name: 'Harry Potter', show_type: 'movie', year: 2000, detail: 'Harry Potter'
    Show.find_or_create_by name: 'Lost', show_type: 'tv', year: 2010, detail: 'Lost TV shows'
    Show.find_or_create_by name: 'Fallout', show_type: 'tv', year: 2024, detail: 'Fallout Series'
    Show.find_or_create_by name: 'Walking Dead', show_type: 'tv', year: 2010, detail: 'The Walking Dead series'
    Show.find_or_create_by name: 'Iron Man', show_type: 'movie', year: 2008, detail: 'Tony Stark'

    Category.find_or_create_by name: 'Action'
    Category.find_or_create_by name: 'Thriller'
    Category.find_or_create_by name: 'Fantasy'
    Category.find_or_create_by name: 'Drama'
    Category.find_or_create_by name: 'Romance'
    Category.find_or_create_by name: 'Sci-Fi'

    show1 = Show.find(1)
    show1_categories = Category.where(id: [1,5])
    show1.categories = show1_categories

    show2 = Show.find(2)
    show2_categories = Category.where(id: [3,6])
    show2.categories = show2_categories

    show3 = Show.find(3)
    show3_categories = Category.where(id: [1,3,5])
    show3.categories = show3_categories

    show4 = Show.find(4)
    show4_categories = Category.where(id: [2,3,4])
    show4.categories = show4_categories

    show5 = Show.find(5)
    show5_categories = Category.where(id: [1,3,6])
    show5.categories = show5_categories

    show6 = Show.find(6)
    show6_categories = Category.where(id: [1,2])
    show6.categories = show6_categories

    show7 = Show.find(7)
    show7_categories = Category.where(id: [1,3,6])
    show7.categories = show7_categories
  end
end
