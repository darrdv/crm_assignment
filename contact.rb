class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts['id']
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attrib, value)
    case attrib
    when  "first name"
      @@contacts['first_name'] = value
    when "last name"
      @@contacts['last_name'] = value
    when "email"
      @@contacts['email'] = value
    else
      "Not Found."
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attrib, value)
    case attrib
    when  "first name"
      if @@contacts['first_name'] == value
        @@contacts['first_name']
      else
        "Not Found"
      end
    when "last name"
      if @@contacts['last_name'] == value
        @@contacts['last_name']
      else
        "Not Found"
      end
    when "email"
      if @@contacts['email'] == value
        @@contacts['email']
      else
        "Not Found."
      end
    else
      "Not Found."
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
    "Contacts have all been deleted."
  end

  def full_name
    "#{first_name} #{last_name}"
  end



  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end
