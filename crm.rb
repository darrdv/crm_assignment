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

    return Contact.find_by(chosen_field, value)

  end

  def delete_contact

  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts

    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  end

  def display_all_contacts

    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def search_by_attribute

    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  # Add other methods here, if you need them.

end

a_crm_app = CRM.new
a_crm_app.main_menu
