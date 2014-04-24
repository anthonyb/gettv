
puts "EMPTY THE MONGODB DATABASE"
Mongoid.purge!

def image_from_file(name)
  File.open(File.join(Rails.root, "/db/images/", name))
end

# ACCESSORY

answers_4 = [ Answer.create({ title: 'Watch',       image: image_from_file('a09.jpg') }),
              Answer.create({ title: 'Top Hat',     image: image_from_file('a08.jpg') }),
              Answer.create({ title: 'Bowtie',      image: image_from_file('a07.jpg') }),
              Answer.create({ title: 'Shoes',       image: image_from_file('a06.jpg') }),
              Answer.create({ title: 'Belt',        image: image_from_file('a05.jpg') }),
              Answer.create({ title: 'Scarf',       image: image_from_file('a04.jpg') }),
              Answer.create({ title: 'Sunglasses',  image: image_from_file('a03.jpg') }),
              Answer.create({ title: 'Feather Boa', image: image_from_file('a02.jpg') }),
              Answer.create({ title: 'Stetson',     image: image_from_file('a01.jpg') }) ].reverse

question_4 = Question.create(title: 'Accessory?', answers: answers_4)

# TRAVEL

answers_2 = [ Answer.create({ title: 'Grand Canyon',  image: image_from_file('t09.jpg') }),
              Answer.create({ title: 'Sleeping',      image: image_from_file('t08.jpg') }),
              Answer.create({ title: 'Vegas',         image: image_from_file('t07.jpg') }),
              Answer.create({ title: 'England',       image: image_from_file('t06.jpg') }),
              Answer.create({ title: 'New Orleans',   image: image_from_file('t05.jpg') }),
              Answer.create({ title: 'Ocean',         image: image_from_file('t04.jpg') }),
              Answer.create({ title: 'Hawaii',        image: image_from_file('t03.jpg') }),
              Answer.create({ title: 'San Francisco', image: image_from_file('t02.jpg') }),
              Answer.create({ title: 'New York',      image: image_from_file('t01.jpg') }) ].reverse

question_2 = Question.create(title: 'Travel?', answers: answers_2)

# COCTAIL

answers_3 = [ Answer.create({ title: 'Champagne',         image: image_from_file('ct09.jpg') }),
              Answer.create({ title: 'Cosmopolitan',      image: image_from_file('ct08.jpg') }),
              Answer.create({ title: 'Tropicana',         image: image_from_file('ct07.jpg') }),
              Answer.create({ title: 'Blended Margarita', image: image_from_file('ct06.jpg') }),
              Answer.create({ title: 'Margarita Green',   image: image_from_file('ct05.jpg') }),
              Answer.create({ title: 'Appletini',         image: image_from_file('ct04.jpg') }),
              Answer.create({ title: 'Margarita Classic', image: image_from_file('ct03.jpg') }),
              Answer.create({ title: 'Red Wine',          image: image_from_file('ct02.jpg') }),
              Answer.create({ title: 'Beer Glass',        image: image_from_file('ct01.jpg') }) ].reverse

question_3 = Question.create(title: 'Coctail?', answers: answers_3)

# CARS

answers_1 = [ Answer.create({ title: 'AMC Pacer',        image: image_from_file('c09.jpg') }),
              Answer.create({ title: 'Rambler American', image: image_from_file('c08.jpg') }),
              Answer.create({ title: 'AMC Orange',       image: image_from_file('c07.jpg') }),
              Answer.create({ title: 'AMC Red',          image: image_from_file('c06.jpg') }),
              Answer.create({ title: 'AMC Black',        image: image_from_file('c05.jpg') }),
              Answer.create({ title: 'Rambler Pink',     image: image_from_file('c04.jpg') }),
              Answer.create({ title: 'Two Wild Horses',  image: image_from_file('c03.jpg') }),
              Answer.create({ title: 'Rambler Blue',     image: image_from_file('c02.jpg') }),
              Answer.create({ title: 'Hillman',          image: image_from_file('c01.jpg') }) ].reverse

question_1 = Question.create(title: 'Car?', answers: answers_1)

# CHARACTERS

Result.create({ male_title:   'Detective',
                female_title: 'Detective',
                answers: answers_1 + answers_3 + answers_2 + answers_4 })

Result.create({ male_title:   'Leading Man',
                female_title: 'Femme Fatale',
                answers: answers_1.values_at(0,4,5,6) +
                         answers_3.values_at(2,3,4,5,6,7,8) +
                         answers_2 +
                         answers_4.values_at(0,1,2,3,7,8) })

Result.create({ male_title:   'Cowboy',
                female_title: 'Kid Sister',
                answers: answers_1.values_at(2,5,8) +
                         answers_3.values_at(0,1,6) +
                         answers_2.values_at(3,7,8) +
                         answers_4.values_at(0,2,4,5,8) })

Result.create({ male_title:   'Playboy',
                female_title: 'Flapper',
                answers: answers_1.values_at(0,4,5,6,7) +
                         answers_3.values_at(0,1,2,3,4,5,7,8) +
                         answers_2.values_at(2,3,5,7) +
                         answers_4.values_at(1,2,5,6,7,8) })

Result.create({ male_title:   'Mob Boss',
                female_title: 'Show Girl',
                answers: answers_1.values_at(0,7) +
                         answers_3.values_at(0,2,3,4,5,6,7,8) +
                         answers_2.values_at(0,1,4,6) +
                         answers_4.values_at(1,3,4,5,6,8) })
