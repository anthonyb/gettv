
puts "EMPTY THE MONGODB DATABASE"
Mongoid.purge!

# CARS

answers_1 = Answer.create([ { title: 'Hillman'           },
                            { title: 'Rambler Blue'      },
                            { title: 'Rambler Pink'      },
                            { title: 'AMC Black'         },
                            { title: 'AMC Red'           },
                            { title: 'AMC Orange'        },
                            { title: 'Rambler American'  },
                            { title: 'AMC Pacer'         },
                            { title: 'Two Wild Horses'   } ])

question_1 = Question.create(title: 'Car?', answers: answers_1)

# TRAVEL

answers_2 = Answer.create([ { title: 'New York'          },
                            { title: 'San Francisco'     },
                            { title: 'Hawaii'            },
                            { title: 'Ocean'             },
                            { title: 'New Orleans'       },
                            { title: 'England'           },
                            { title: 'Vegas'             },
                            { title: 'Sleeping'          },
                            { title: 'Grand Canyon'      } ])

question_2 = Question.create(title: 'Travel?', answers: answers_2)

# COCTAIL

answers_3 = Answer.create([ { title: 'Beer Glass'        },
                            { title: 'Red Wine'          },
                            { title: 'Margarita Classic' },
                            { title: 'Appletini'         },
                            { title: 'Margarita Green'   },
                            { title: 'Blended Margarita' },
                            { title: 'Tropicana'         },
                            { title: 'Cosmopolitan'      },
                            { title: 'Champagne'         } ])

question_3 = Question.create(title: 'Coctail?', answers: answers_3)

# ACCESSORY

answers_4 = Answer.create([ { title: 'Stetson'           },
                            { title: 'Feather Boa'       },
                            { title: 'Sunglasses'        },
                            { title: 'Scarf'             },
                            { title: 'Belt'              },
                            { title: 'Shoes'             },
                            { title: 'Bowtie'            },
                            { title: 'Top Hat'           },
                            { title: 'Watch'             } ])

question_4 = Question.create(title: 'Accessory?', answers: answers_4)

# CHARACTERS

results = Result.create([ { male_title: 'Detective',   female_title: 'Detective'    },
                          { male_title: 'Leading Man', female_title: 'Femme Fatale' },
                          { male_title: 'Cowboy',      female_title: 'Kid Sister'   },
                          { male_title: 'Playboy',     female_title: 'Flapper'      },
                          { male_title: 'Mob Boss',    female_title: 'Show Girl'    } ])
