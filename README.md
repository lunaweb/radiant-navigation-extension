radiant-navigation-extension
=============================

Installation
------------

git clone git://github.com/lunaweb/radiant-navigation-extension.git

Utilisation
-----------

Le tag "<r:nav>" permet de garder en mémoire la page courante (page affichée ou page contextuelle d'une boucle).

Il est ensuite possible de vérifier si une page est active ou non, c'est à dire si elle est présente dans le fil d'ariane de la page affichée.

	<r:nav>
		<r:find url="/">
			<ul>
				<r:children:each>
					<li<r:if_active> class="active"</r:if_active>><r:link /></li>
				</r:children:each>
			</ul>
		</r:find>
	</r:nav>