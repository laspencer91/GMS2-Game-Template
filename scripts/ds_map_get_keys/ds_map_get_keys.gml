/// @description Returns a list of keys found in a given map
/// @function ds_map_get_keys(map)
/// @param ds_map Map to get keys from

var _tMap        = argument0;
var _tKeyList    = ds_list_create();
var _tCurrentKey = ds_map_find_first(_tMap);

while (!is_undefined(_tCurrentKey))
{
	ds_list_add(_tKeyList, _tCurrentKey);
	_tCurrentKey = ds_map_find_next(_tMap, _tCurrentKey);
}
return _tKeyList;

ds_list_destroy(_tKeyList);