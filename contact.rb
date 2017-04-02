class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts  = []
  @@unique_id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email = "N/A", note = "N/A")
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @note       = note
    @id         = @@unique_id
    @@unique_id +=1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create (first_name, last_name, email = "N/A", note = "N/A")
    contact= new(first_name, last_name, email, note)
    @@contacts << contact
    contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts.each do |contact|
      puts "#{contact.first_name} #{contact.last_name} , #{contact.email} \n Note: #{contact.note}"
    end
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

  end

  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end

contact = Contact.create("Mark", "Conlon")
contact.email = "fake@gmail.com"
contact1 = Contact.create("Peter", "Parker", "N/A", "Spiderman")
Contact.all
