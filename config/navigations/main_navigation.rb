SimpleNavigation::Configuration.run do |navigation|
  navigation.autogenerate_item_ids = false
  navigation.selected_class = nil
  navigation.active_leaf_class = 'active'

  navigation.items do |primary|
    primary.dom_class = 'left'

    primary.with_options(if: proc { user_signed_in? }) do |signed_in_user|
      signed_in_user.item :dashboard, 'Home', root_path
    end
  end
end
