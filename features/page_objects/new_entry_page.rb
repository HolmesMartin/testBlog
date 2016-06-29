require 'page-object'

class NewEntry
  include PageObject

  text_field(:title, :id => 'blogTitle')
  text_field(:content, :id => 'blogContent')
  button(:submit_entry, :id => 'blogSubmit')
end

class NewEntrySuccess
  include PageObject

  div(:success_message, :id => 'successMessage')
end