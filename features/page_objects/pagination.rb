require 'page-object'

class Pagination
  include PageObject
  div(:paginated, :class => 'pagination')
end

class NumericPage
  include PageObject
  link(:numericPage, :text => '2')
  div(:paginate, :class => 'pagination')
  link(:numeric1, :text => '1')
end

class NextPage
  include PageObject
  link(:nextPage, :text => 'Next')
  div(:paginate, :class => 'pagination')
end

class TenPlus
  include PageObject
  div(:paginated, :class => 'pagination')
  divs(:results, :xpath => '//div[@class="entry"]/h2/a')
end