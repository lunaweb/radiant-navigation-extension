class NavigationExtension < Radiant::Extension
  
  version "1.0"
  description "Tags de navigation pour générer les menus"
  url "https://github.com/lunaweb/radiant-navigation-extension"
  
  def activate
    Page.send :include, NavigationTags
  end
  
end
