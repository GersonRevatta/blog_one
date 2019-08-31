module NavigationHelper
  def links_partial_path
    user_signed_in? ? 'shared/navbar/signed_in' : 'shared/navbar/no_signed_in'
  end
end
