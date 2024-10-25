# Validate the value of the :publish option to ensure it is a Boolean.
# validate_boolean_option(publish: publish) do |option_name, option_value|
#   UI.user_error!(
#     "Expected :#{option_name} to be a Boolean. Got #{option_value.class} instead." \
#     "Please pass a valid value for the :#{option_name} option, or leave it out to default to false."
#   )
# end
def validate_boolean_option(options)
  options.each do |option_name, option_value|
    unless [true, false].include? option_value
        yield option_name, option_value if block_given?
    end
  end
end

def get_package_name
  CredentialsManager::AppfileConfig.try_fetch_value(:package_name)
end

def get_publish_par(options)
  # Get the value of the :publish option, defaulting to false.
  publish = options.fetch(:publish, false)

  # Display a warning if the :publish option is set to false.
  if publish == false
    UI.important "Warning: publish is set to false. The app will not be published and will do a dry run."
    UI.important "If you want to publish the app, please set the :publish option to true (bundle exec fastlane deploy_internal publish:true)."
  end

  publish
end

def get_draft_par(options)
  is_draft = options.fetch(:is_draft, false)

  if is_draft == true
    UI.important("Warning: is_draft is set to true. After app upload, please go to Google Play Console to finish the deployment.")
  end

  is_draft
end
