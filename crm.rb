class CRM
  require_relative 'contact'

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
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

  def print_field_options
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email'
  end


  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit_the_program

      # Finish off the rest for 3 through 6
      # To be clear, the methods add_new_contact and modify_existing_contact
      # haven't been implemented yet
      end
    end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact
    puts "Enter the user ID of the contact to be modified: "
    id = gets.to_i
    puts 'What field do you wish to modify?'
    print_field_options
    field = gets.to_i
    puts 'Enter new value:'
    value = gets.chomp

    case field
    when 1
      chosen_field = 'first_name'
    when 2
      chosen_field = 'last_name'
    when 3
      chosen_field = 'email'
    end

    #contact = Contact.find_by(chosen_field, value)
    contact = Contact.find(id)
    contact.update(chosen_field, value)

  end

  def delete_contact
    print "Please enter the ID of the contact to be deleted."
    id = gets.to_i
    selected_contact = Contact.find(id)
    selected_contact.delete
  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts(contacts)
      contacts.each do | contact |
        puts "ID #{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
      end
  end

# HINT: Make use of the display_contacts method to keep your code DRY
  def display_all_contacts
    all_contacts = Contact.all
    display_contacts(all_contacts)
  end

  def search_by_attribute
    results = []
    puts "Please select the field you wish to search on: "
    print_field_options
    search_field = gets.to_i

    case search_field
    when 1
     chosen_field = 'first_name'
    when 2
     chosen_field = 'last_name'
    when 3
     chosen_field = 'email'
    end

    puts "What value are you searching for: "
    value = gets.chomp

    results = Contact.find_by(chosen_field, value)

    #HINT: Make use of the display_contacts method to keep your code DRY
    display_contacts(results)

  end

  def exit_the_program
    exit
  end

  # Add other methods here, if you need them.

end

a_crm_app = CRM.new
a_crm_app.main_menu
