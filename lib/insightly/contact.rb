module Insightly
  class Contact < ReadWrite
    include Insightly::AddressHelper
    include Insightly::ContactInfoHelper
    include Insightly::LinkHelper
    include Insightly::TagHelper

    self.url_base = "Contacts"
    CUSTOM_FIELD_PREFIX = "CONTACT_FIELD"
    api_field "CONTACT_ID",
              "SALUTATION",
              "FIRST_NAME",
              "LAST_NAME",
              "BACKGROUND",
              "CONTACT_FIELD_1",
              "CONTACT_FIELD_2",
              "CONTACT_FIELD_3",
              "CONTACT_FIELD_4",
              "CONTACT_FIELD_5",
              "CONTACT_FIELD_6",
              "CONTACT_FIELD_7",
              "CONTACT_FIELD_8",
              "CONTACT_FIELD_9",
              "CONTACT_FIELD_10",
              "DATE_CREATED_UTC",
              "DATE_UPDATED_UTC",
              "VISIBLE_TO",
              "VISIBLE_TEAM_ID"

    def initialize(id = nil)
      @data = {}
      @data["ADDRESSES"] = []
      load(id) if id
    end
    def remote_id
      contact_id
    end
    def fix_for_link(link)
      #This needs to auto set the org id on the item
      link.contact_id = self.remote_id
      link
    end
  end
end