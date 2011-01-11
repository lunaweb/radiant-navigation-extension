module NavigationTags
  
  include Radiant::Taggable
  
  @@breadcrumbs = []
  
  desc %{ Englobe des tags de navigation. }
  tag "nav" do |tag|
    tag.locals.current = tag.locals.page
    breadcrumbs ||= @@breadcrumbs[tag.locals.page.id]
    
    unless breadcrumbs
      parent = tag.locals.page
      breadcrumbs = []
      while parent do
        breadcrumbs.unshift parent
        parent = breadcrumbs.first.parent
      end
      if breadcrumbs.first.slug == '/'
        breadcrumbs.shift
      end
      @@breadcrumbs[tag.locals.page.id] = breadcrumbs
    end
    
    tag.expand
  end
  
  desc %{ Détecte si la page courante fait partie du fil d'ariane. }
  tag "nav:if_active" do |tag|
    active = false
    @@breadcrumbs[tag.locals.current.id].each do |page|
      active = true if page.id == tag.locals.page.id
    end
    tag.expand if active
  end
  
end