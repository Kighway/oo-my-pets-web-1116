class Owner

  attr_accessor :name, :pets
  attr_reader  :species

  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @pets ||= {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    all.length
  end

  def species
    @species
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish (name)
    @pets[:fishes].push(Fish.new(name))
  end

  def buy_cat (name)
    @pets[:cats].push(Cat.new(name))
  end

  def buy_dog (name)
    @pets[:dogs].push(Dog.new(name))
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood= "happy" }
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood= "happy" }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood= "happy" }
  end

  def sell_pets
    @pets.each do |species_key, pet_arrays|
      pet_arrays.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end

end
