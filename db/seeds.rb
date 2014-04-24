
puts "EMPTY THE MONGODB DATABASE"
Mongoid.purge!

def image_from_file(name)
  File.open(File.join(Rails.root, "/db/images/", name))
end

# ACCESSORY

answers_4 = Answer.create([ { title: 'Stetson',     image: image_from_file('a01.jpg') },
                            { title: 'Feather Boa', image: image_from_file('a02.jpg') },
                            { title: 'Sunglasses',  image: image_from_file('a03.jpg') },
                            { title: 'Scarf',       image: image_from_file('a04.jpg') },
                            { title: 'Belt',        image: image_from_file('a05.jpg') },
                            { title: 'Shoes',       image: image_from_file('a06.jpg') },
                            { title: 'Bowtie',      image: image_from_file('a07.jpg') },
                            { title: 'Top Hat',     image: image_from_file('a08.jpg') },
                            { title: 'Watch',       image: image_from_file('a09.jpg') } ].reverse!)

question_4 = Question.create(title: 'Accessory?', answers: answers_4)

# COCTAIL

answers_3 = Answer.create([ { title: 'Beer Glass',        image: image_from_file('ct01.jpg') },
                            { title: 'Red Wine',          image: image_from_file('ct02.jpg') },
                            { title: 'Margarita Classic', image: image_from_file('ct03.jpg') },
                            { title: 'Appletini',         image: image_from_file('ct04.jpg') },
                            { title: 'Margarita Green',   image: image_from_file('ct05.jpg') },
                            { title: 'Blended Margarita', image: image_from_file('ct06.jpg') },
                            { title: 'Tropicana',         image: image_from_file('ct07.jpg') },
                            { title: 'Cosmopolitan',      image: image_from_file('ct08.jpg') },
                            { title: 'Champagne',         image: image_from_file('ct09.jpg') } ].reverse!)

question_3 = Question.create(title: 'Coctail?', answers: answers_3)

# TRAVEL

answers_2 = Answer.create([ { title: 'New York',      image: image_from_file('t01.jpg') },
                            { title: 'San Francisco', image: image_from_file('t02.jpg') },
                            { title: 'Hawaii',        image: image_from_file('t03.jpg') },
                            { title: 'Ocean',         image: image_from_file('t04.jpg') },
                            { title: 'New Orleans',   image: image_from_file('t05.jpg') },
                            { title: 'England',       image: image_from_file('t06.jpg') },
                            { title: 'Vegas',         image: image_from_file('t07.jpg') },
                            { title: 'Sleeping',      image: image_from_file('t08.jpg') },
                            { title: 'Grand Canyon',  image: image_from_file('t09.jpg') } ].reverse!)

question_2 = Question.create(title: 'Travel?', answers: answers_2)

# CARS

answers_1 = Answer.create([ { title: 'Hillman',          image: image_from_file('c01.jpg') },
                            { title: 'Rambler Blue',     image: image_from_file('c02.jpg') },
                            { title: 'Two Wild Horses',  image: image_from_file('c03.jpg') },
                            { title: 'Rambler Pink',     image: image_from_file('c04.jpg') },
                            { title: 'AMC Black',        image: image_from_file('c05.jpg') },
                            { title: 'AMC Red',          image: image_from_file('c06.jpg') },
                            { title: 'AMC Orange',       image: image_from_file('c07.jpg') },
                            { title: 'Rambler American', image: image_from_file('c08.jpg') },
                            { title: 'AMC Pacer',        image: image_from_file('c09.jpg') } ].reverse!)

question_1 = Question.create(title: 'Car?', answers: answers_1)

# CHARACTERS

results = Result.create([ { male_title: 'Detective',   female_title: 'Detective'    },
                          { male_title: 'Leading Man', female_title: 'Femme Fatale' },
                          { male_title: 'Cowboy',      female_title: 'Kid Sister'   },
                          { male_title: 'Playboy',     female_title: 'Flapper'      },
                          { male_title: 'Mob Boss',    female_title: 'Show Girl'    } ])
