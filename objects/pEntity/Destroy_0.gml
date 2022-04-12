/// @desc Drop Fragments and Items

if (entityFragmentCount > 0) 
{
	fragmentArray = array_create(entityFragmentCount, entityFragment);
	DropItems(x, y, fragmentArray);
}


if (entityDropList != -1)
{
	DropItems(x, y, entityDropList);
}
