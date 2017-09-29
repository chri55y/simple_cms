class Page < ApplicationRecord

  belongs_to :subject, optional: true # foreign key info would go here, if we didn't already have a FK on pages
      # had to add the ", optional: true" above to get around Rails validations
end
