require_relative 'contact.rb'

class CRM

  def initialize(contact_folder)
    @contact_folder = contact_folder
  end

  def main_menu
    while true
      print_main_menu
      user_selection = gets.to_i
      call_option(user_selection)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selection)
    case user_selection
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit(true)
    end
  end

  def add_new_contact
    puts "Enter the first name: "
    first_name = gets.chomp

    puts "Enter the last name: "
    last_name = gets.chomp

    puts "Enter an email (you can leave blank): "
    email = gets.chomp

    puts "Enter a note (can be blank): "
    note = gets.chomp

    contact = Contact.create(first_name, last_name, email, note)

    puts "#{contact.first_name} was added successfully"
  end

  def modify_existing_contact
    puts "To ensure you have the correct person please enter the unique id:"
    id = gets.chomp.to_i
    contact = Contact.find(id)
    puts "#{contact.full_name}"
    puts "Is this the corrrect contact? [y] [n]:"
    answer = gets.chomp.downcase
    if answer == "y"
      puts "Choose on of the following options"
      puts "Enter [first_name] for First Name"
      puts "Enter [last_name] for Last Name"
      puts "Enter [email] for Email"
      puts "Enter [note] for Note"
      option = gets.chomp
      puts "Enter the approiate value: "
      value = gets.chomp
      contact = Contact.find_by(option, value)
      contact.each do |attribute|
        attribute.update(option, value)
      end
    elsif answer == "n"
      modify_existing_contact
    else
      puts "You entered an invalid selection please try again"
    end
  end

  #works unless the id number does not exist then it crashes
  def delete_contact
    puts "Deleting requires the unique id. Please enter the id: "
    id = gets.chomp.to_i
    contact = Contact.find(id)
    puts "#{contact.full_name}"
    puts "Is this the corrrect contact? [y] [n]:"
    answer = gets.chomp.downcase
    if answer == "y"
      contact.delete
    elsif answer == "n"
      delete_contact
    else
      puts "You entered an invalid selection please try again"
    end
  end

  def display_all_contacts

  end

  def search_by_attribute

  end


end

address_book = CRM.new("Mark")
address_book.main_menu
