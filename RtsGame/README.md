## 26 - 10 - 2025
adding a tilemaplayer 2D node, and also a tileset resource from sprites > backgrounds > menu_background.png
Main
	(Camera2D)
	(TileMapLayer)

Navigation Region is essentially a node which a navigation agent can walk
our units are going to be navigation agents so they need to know where they can walk

(NavigationRegion2D)
	(NavigationObstacle2D)
--> we need to create a polygon to use it 
	--> to use the navigation osbtacles polygons we need to bake them over the NavigationRegion2D node !

(Unit_Base)
	(Sprite2D)
	(CollisionShape2D)
	(NavigationAgent2D)
	(HealthBar)
